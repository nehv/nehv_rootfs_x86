#!/usr/bin/perl
#
# vyatta-update-ctontab.pl: crontab generator
#
# Maintainer: Daniil Baturin <daniil@baturin.org>
#
# Copyright (C) 2013 SO3Group
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#

use lib "/opt/vyatta/share/perl5/";

use strict;
use warnings;
use Vyatta::Config;

my $default_user = "root";
my $crontab = "/etc/cron.d/vyatta-crontab";
my $crontab_header = "### Added by /opt/vyatta/sbin/vyatta-update-crontab.pl ###\n";

sub error
{
    my ($task, $msg) = @_;
    die("Error in task $task: $msg");
}

sub update_crontab
{
    my $count = 0;
    my $config = new Vyatta::Config();

    if( !$config->exists("system task-scheduler task") )
    {
        # Nothing to do
        system("rm -rf $crontab");
        exit(0);
    }

    $config->setLevel("system task-scheduler task");

    my $crontab_append = $crontab_header;

    my @tasks = $config->listNodes();

    foreach my $task (@tasks)
    {
        my $minutes = "*";
        my $hours = "*";
        my $days ="*";

        my $user = $default_user;
        my $executable = undef;
        my $arguments = undef;

        my $interval = undef;
        my $crontab_spec = undef;

        my $crontab_string = undef;

        # Unused now
        my $months = "*";
        my $days_of_week = "*";

        # Executable is mandatory
        $executable = $config->returnValue("$task executable path");
        if( !defined($executable) )
        {
            error($task, "must define executable");
        }

        # Arguments are optional
        $arguments = $config->returnValue("$task executable arguments");
        $arguments = "" unless defined($arguments);

        $interval = $config->returnValue("$task interval");
        $crontab_spec = $config->returnValue("$task crontab-spec");

        # "interval" and "crontab-spec" are mutually exclusive
        if( defined($interval) &&
            defined($crontab_spec) )
        {
            error($task, "can not use interval and crontab-spec at the same time!");
        }

        if( defined($interval) )
        {
            my ($value, $suffix) = ($interval =~ /(\d+)([mdh]){0,1}/);

            if( !defined($suffix) || ($suffix eq 'm') )
            {
                if( $value > 60 )
                {
                    error("Interval in minutes must not exceed 60!");
                }

                $minutes = "*/$value";
            }
            elsif( $suffix eq 'h' )
            {
                if( $value > 24 )
                {
                    error("Interval in hours must not exceed 24!");
                }

                $minutes = "0";
                $hours = "*/$value";
            }
            elsif( $suffix eq 'd' )
            {
                if( $value > 31 )
                {
                   error("Interval in days must not exceed 31!");
                }

                $minutes = "0";
                $hours = "0";
                $days = "*/$value";
            }

            $crontab_string = "$minutes $hours $days $months $days_of_week $user $executable $arguments\n"
        }
        elsif( defined($crontab_spec) )
        {
            $crontab_string = "$crontab_spec $user $executable $arguments\n";
        }
        else
        {
            error($task, "must define either interval or crontab-spec")
        }

        $crontab_append .= $crontab_string;
        $count++;
    }

    if ($count > 0) {
        open(HANDLE, ">$crontab") 
            || die("Could not open /etc/crontab for write");
        select(HANDLE);
        print $crontab_append;
        close(HANDLE);
    } else {
        system("rm -rf $crontab");
    }
}

update_crontab();

exit(0);
