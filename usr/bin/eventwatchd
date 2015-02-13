#!/usr/bin/perl

# Module: eventwatch.pl
#
# **** License ****
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
#
# Copyright (C) 2012 Daniil Baturin <daniil@baturin.org>, Jon Andersson
# Copyright (C) 2014 VyOS Development Group
#
# **** End License ****
#

package Eventwatch;

use strict;
use POSIX;
use Fcntl;
use XML::Simple;
use Sys::Syslog;
use Getopt::Long;
use threads;
use Data::Dumper;

### Constants
use constant 
{
    # Program settings
    DEFAULT_CONFIG => "/etc/eventwatchd/eventwatchd.conf",
    PROGRAM_NAME => "eventwatchd",
    PROGRAM_VERSION => "0.2",
    PID_FILE => "/var/run/eventwatchd.pid",

    # Program exit codes
    SUCCESS => 0,
    ERROR => 1,

    # Subroutine error codes
    SUB_ERROR => 0,
    SUB_SUCCESS => 1,

    # Fcntl file lock/unlock constants
    SET_EXCLUSIVE_LOCK => 2,
    UNLOCK => 8
};

### Global variables

# Config file path,
# may be changed by specifying --config= command line option
my $configFile = undef;

# Do not detach from terminal and daemonize,
# may be changed by --no-daemon option
my $foregroundRun = 0;

# Turns on detailed debugging if set to non zero
# This can not be controlled externally
my $debugLevel = 0;

## Logging settings
my $logFacility = "daemon";

# Duplicate log messages to standard output
my $logOptions = "perror";


### Main functions

# Read config file and return config hash
# or undef if config loading failed
sub readConfig
{
    my $file = shift;
    my $configHash = undef;

    if (!defined($file))
    {
        $file = DEFAULT_CONFIG;
    }

    if (!-r $file)
    {
        syslog("err", "%s", qq{Could not open config file "$file"});
    }
    else
    {
        # ForceArray option makes XML::Simple render XML tags 
        # as arrays even if only one node with that name is present
        # so we can loop through it
        $configHash = XMLin($file, ForceArray => ['policy', 'feed', 'event', 'pattern']);
    }

    # Dump the hash if debug is on
    if (defined($configHash) && ($debugLevel > 0))
    {
        print Dumper($configHash);
    }

    return $configHash;
}


# Handle a feed, intended to run as a thread
sub feed 
{
    my ($name, $type, $source, $policy) = @_;

    syslog("info", "%s", "Starting thread for feed $name\n");

    syslog("debug", "%s", "Thread for feed $name started with arguments: type $type, source \"$source\"\n");

    if ($type eq "fifo")
    {
        # We should open the FIFO for both
        # read and write to keep it open if the other side exists
        # (e.g. daemon restarts)
        unless (open(HANDLE, "+<$source"))
        {
            syslog("err", "%s", qq{Could not open "$source": $!\n});
            threads->exit(SUB_ERROR);
        }
    }
    elsif ($type eq "command")
    {
        unless (open(HANDLE, "$source|"))
        {
            syslog("err", "%s", qq{Could not run $source: $!\n});
            threads->exit(SUB_ERROR);
        }
    }
    else
    {
        syslog("err", "%s", qq{Unknown feed type "$type"});
        threads->exit(SUB_ERROR);
    }  

    # Cleanup and exit
    sub exitThread
    {
        syslog("info", "%s", "Thread $name is terminating");
        close(HANDLE);
        threads->exit(SUB_SUCCESS);
    }

    # Kill signal is sent from main()
    # when daemon terminates
    $SIG{'KILL'} = \&exitThread;


    while (<HANDLE>) 
    {
        for my $key (keys %{$policy}) 
        {
             foreach my $pattern (@{$policy->{$key}->{'pattern'}}) 
             {
                 if ($_ =~ m/$pattern/) 
                 {
                     my $command = $policy->{$key}->{'run'};

                     my $result = system($command);
                     if ($result != 0)
                     {
                         syslog("error", "%s", qq{Executing "$command" failed: $?\n});
                         
                     }
                     else
                     {
                        syslog("notice", "%s", qq{Event "$key" caught in feed "$name", command "$command" executed"} );
                     }

                     # We want the command to be executed on first match in each event only
                     last;
                 }
             }
        }
    }
}

sub main 
{
    # Some perl interpreters or builds may not support
    # threads while we need this capability to run properly
    my $threadsSupported = eval 'use threads; 1';
    if (!$threadsSupported)
    {
        die("Multithreading is required to run for this program, but apparently is not supported. Check your perl build options.");
    }

    openlog(PROGRAM_NAME, $logOptions, $logFacility);

    # Read config file
    my $config = readConfig($configFile);
    if (!defined($config))
    {
        syslog("err", "%s", "Config file loading failed, exiting");
        exit(ERROR);
    }

    # Daemonize unless --no-daemon option is specified
    daemonize() unless $foregroundRun;

    # Create a PID file
    my $pidFile = PID_FILE;
    unless (open PID_HANDLE, ">$pidFile")
    {
       syslog("err", "%s", "Could not create PID file: $!");
       exit(ERROR);
    }
    writePid($$, \*PID_HANDLE);

    my $feeds = $config->{'feeds'}->{'feed'};
    # We need at least one feed to run
    if (!defined($feeds))
    {
        syslog("err", "%s", "Must specify at least one feed");
        exit(ERROR);
    }

    my $policies = $config->{'policies'}->{'policy'};
    # We need at least one policy too
    if (!defined($policies))
    {
        syslog("err", "%s", "Must specify at least one policy");
        terminate(ERROR);
    }

   syslog("info", "%s", "Starting threads");

    # Spawn feeds
    my %threads;
    for my $key (keys %{$feeds}) 
    {
         my $feed = $feeds->{$key};
         next if ($feed->{'disable'} eq "disable");

         # Check feed type, must be defined and
         # equal either "fifo" or "feed"
         my $type = $feed->{'type'};
         if (!defined($type))
         {
             syslog("err", "%s", "Type for feed \"$key\" is not defined");
             terminate(ERROR);
         }
         elsif (!( ($type eq "fifo") || ($type eq "command") ))
         {
             syslog("err", "%s", qq{Wrong type for feed "$key", type can be either "fifo" or "command"});
             terminate(ERROR);
         }

         # Check source, must be defined
         # and be readable for "fifo" type and
         # executable for "command" type
         my $source = $feed->{'source'};
         if (!defined($source))
         {
            syslog("err", "%s", qq{Source for feed "$key" is not defined});
            terminate(ERROR);
         }

         # TODO: Check if file is actually a FIFO
         if (($type eq "fifo") && !(-r $source))
         {
             syslog("err", "%s", qq{Source for feed "$key" is not readable});
             terminate(ERROR);
         }
         elsif (($type eq "command"))
         {
             # Extract first word,
             # as we believe $source is a command and arguments like
             # "/bin/tail -f /tmp/logfile"
             my ($command) = split(/ /, $source);

             if (!-x $command)
             {
                 syslog("err", "%s", qq{Feed $key source command "$command" is not an executable or not found});
                 terminate(ERROR);
             }
         }

         # Check policy, must be defined
         my $policyName = $feed->{'policy'};
         if (!defined($policyName))
         {
             syslog("err", "%s", qq{Policy for feed "$key" is not defined});
              terminate(ERROR);
         }

         # Extract specified policy from config hash
         my $policy = undef;
         for my $polkey (keys %{$policies}) {
             $policy = $policies->{$polkey} if( $polkey eq $policyName );
         }

         if (!defined($policy))
         {
             syslog("err", "%s", qq{Policy "$policyName" specified for feed "$key" does not exist});
             terminate(ERROR);
         }
         
         $policy = $policy->{'event'};

         # Now we can spawn the thread
         my $thread  = threads->create(\&feed, $key, $type, $source, $policy);
         %threads->{$key} = $thread;
    }

    print Dumper(%threads) if $debugLevel > 1;

    sub terminate
    {
        my $error = shift;

        syslog("notice", "%s", PROGRAM_NAME." is terminating");

        releasePid(\*PID_HANDLE);
        
        # Terminate threads
        for my $key (keys %threads) {
            my $thread = %threads->{$key};
            print qq{Stopping thread for "$key" feed\n};
            $thread->kill('KILL')->detach();
        }

        exit($error);
    }

    sub terminateNormally
    {
       terminate(SUCCESS);
    }

    $SIG{'INT'} = \&terminateNormally;
    $SIG{'TERM'} = \&terminateNormally;
    $SIG{'KILL'} = sub { exit(0); };

    # Main loop
    while () {
        # Nothing amazing happens here,
        # only the ordinary
        for my $key (keys %threads) {
            my $thread = %threads->{$key};
            if ($thread->is_running()) {
                # Replace with something meaningful
                print "Thread for $key is running\n" if $debugLevel > 0;
            }
        }
        sleep(10);
    }
}

### Auxillary functions

## Show help message and exit
sub displayHelp {
    my $message = PROGRAM_NAME." looks up patterns in a log file or other text stream
and executes user defined commands mapped to the patterns.

Usage: $0 [--no-daemon] [--config=/path/to/config]

Options:
--no-daemon                       Run in foreground, put messages to the
                                  standard output.

--config=<path to config file>    Use specified config file instead of default.
                                  Default is ".DEFAULT_CONFIG.".



--version                         Print version and exit.

--help                            Show this message and exit.

";

    print $message;
    exit(SUCCESS);
}

## Show version and exit
sub displayVersion {
    print PROGRAM_NAME." event handling daemon version ".PROGRAM_VERSION."\n";
    print "Copyright 2014 VyOS Development Group\n";
    print "Distributed under the terms of GNU General Public License\n";
    exit(SUCCESS);
}

## Get into daemon mode
sub daemonize
{
     syslog("info", "%s", "Starting in daemon mode") if $debugLevel > 0;

     my $pid = fork();
     if (!defined($pid))
     {
          # Fork failed
          die "Could not spawn child process: $!, exiting";
     }
     elsif ($pid > 0)
     {
         # Child has been spawned succefully,
         # parent should terminate now
         exit(SUCCESS);
     }
     chdir("/");
     umask(0);
     setsid();

     # Close standard i/o stream descriptors
     open STDIN, "/dev/null" or die "Can't read /dev/null: $!";
     open STDOUT, ">>/dev/null" or die "Can't write to /dev/null: $!";
     open STDERR, ">>/dev/null" or die "Can't write to /dev/null: $!";
}

## Create a PID file
sub writePid
{
    my ($pid, $fh) = @_;

    unless (flock($fh, SET_EXCLUSIVE_LOCK))
    {
       syslog("err", "%s", "Could not lock PID file: $!");
       exit(ERROR);
    }

    print($fh $pid);
}

sub releasePid
{
    my $fh = shift;
    flock($fh, UNLOCK);
    close($fh);
    unlink(PID_FILE);
}

# Check if PID file exists,
# if it does the daemon is probably running already
sub isRunning
{
    if (-e PID_FILE)
    {
        return(1);
    }
    else
    {
        return(0);
    }
}


### Get options and decide what to do
my $help = undef;
my $version = undef;

GetOptions(
    "no-daemon" => \$foregroundRun,
    "config=s"  => \$configFile,
    "debug-level=i" => \$debugLevel,
    "help" => \$help,
    "version" => \$version
);

displayHelp() if defined($help);
displayVersion() if defined($version);

main();

