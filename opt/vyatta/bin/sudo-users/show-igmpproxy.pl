#!/usr/bin/perl
#
# Module: show-igmpproxy.pl
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
# This code was originally developed by Ubiquiti, Inc.
# Portions created by Ubiquiti are Copyright (C) 2011 Ubiquiti, Inc.
# All Rights Reserved.
# 
# Author: Stig Thormodsrud
# Date: July 2011
# Description: Script to show igmpproxy info
# 
# **** End License ****
#

use Getopt::Long;
use POSIX;
use NetAddr::IP;
use Config;

use warnings;
use strict;

my $mr_cache = '/proc/net/ip_mr_cache';
my $mr_vif   = '/proc/net/ip_mr_vif';


sub byte_string {
    my ($size) = @_;

    if ($size > 1099511627776) {   
        return sprintf("%.2fTB", $size / 1099511627776);
    } elsif ($size > 1073741824) { 
        return sprintf("%.2fGB", $size / 1073741824);
    } elsif ($size > 1048576) {   
        return sprintf("%.2fMB", $size / 1048576);
    } elsif ($size > 1024) {      
        return sprintf("%.2fKB", $size / 1024);
    } else {                      
        return sprintf("%.2fb", $size);
    }
}

sub read_file {
    my ($filename) = @_;

    die "Error: file [$filename] not found\n" if ! -e $filename;

    open(my $FILE, '<', $filename) or die "Error: read [$filename] $!";

    my @lines = <$FILE>;
    close($FILE);
    chomp @lines;
    return @lines
}

sub ip_string {
    my ($ip_hex) = @_;

    if ($Config{byteorder} == 1234) {  
        # little endian
        my $tmp_val = pack('I!', hex($ip_hex));
        $ip_hex = unpack('H*', $tmp_val);
    } 
    my $ip = new NetAddr::IP(hex($ip_hex));
    return '-' if ! defined $ip;
    return $ip->addr;
}

sub parse_mr_vif {
    my @lines = read_file($mr_vif);
    shift @lines; # skip 
    return if scalar(@lines) < 1;

    my %vif = ();
    foreach my $line (@lines) {
        my ($space, $ifnum, $ifname, $bytes_in, $pkts_in, $bytes_out, $pkts_out,
            $flags, $loc, $remote) = split(/\s+/, $line);
        $vif{$ifnum}{ifname}    = $ifname;
        $vif{$ifnum}{bytes_in}  = $bytes_in;
        $vif{$ifnum}{pkts_in}   = $pkts_in;
        $vif{$ifnum}{bytes_out} = $bytes_out;
        $vif{$ifnum}{pkts_out}  = $pkts_out;
        $vif{$ifnum}{flags}     = $flags;
        $vif{$ifnum}{loc}       = $loc;
        $vif{$ifnum}{remote}    = $remote;
    }
    return %vif;
}

sub parse_mr_intf {
    
    my %vif = parse_mr_vif();
    
    my $format = "%-5s  %12s  %12s  %12s  %12s  %15s\n";
    printf($format, 'Intf', 'BytesIn', 'PktsIn', 'BytesOut', 'PktsOut',
                    'Local');

    for my $ifnum (sort keys %vif) {      
        my $ifname      = $vif{$ifnum}{ifname};
        my $bytes_in    = $vif{$ifnum}{bytes_in};
        my $pkts_in     = $vif{$ifnum}{pkts_in};
        my $bytes_out   = $vif{$ifnum}{bytes_out};
        my $pkts_out    = $vif{$ifnum}{pkts_out};
        my $flags       = $vif{$ifnum}{flags};
        my $loc         = $vif{$ifnum}{loc};
        my $remote      = $vif{$ifnum}{remote};
        my $bytes_in_s  = byte_string($bytes_in);
        my $bytes_out_s = byte_string($bytes_out);
        my $loc_ip      = ip_string($loc);
        my $remote_ip   = ip_string($remote);
        printf($format, $ifname, $bytes_in_s, $pkts_in, $bytes_out_s, $pkts_out,
            $loc_ip);
    }
}

sub parse_mr_cache {
    
    my @lines = read_file($mr_cache);
    shift @lines; # skip 
    return if scalar(@lines) < 1;

    my %vif = parse_mr_vif();

    my $format = "%-15s %-15s  %-5s  %-5s %12s  %12s  %5s\n";
    printf($format, 'Group', 'Origin', 'In', 'Out', 'Pkts', 'Bytes', 
                    'Wrong');
    foreach my $line (@lines) {
        my ($group, $origin, $iif, $pkts, $bytes, 
            $wrong, @oifs) = split(/\s+/, $line);

        my $group_ip  = ip_string($group);
        my $origin_ip = ip_string($origin);
        if ($iif == -1 or $iif == 65535) {
            printf($format, $group_ip, $origin_ip, '--','','','','');
        } else {
            my $iif_s = $vif{$iif}{ifname};
            $iif_s = 'unknown' if ! defined $iif_s;
            my $bytes_s = byte_string($bytes);
            foreach my $oif (@oifs) {
                my $oif_s;
                if ($oif =~ /(\d+)\:(\d+)/) {
                    $oif_s = $vif{$1}{ifname};
                }
                $oif_s = 'unknown' if ! defined $oif_s;
                printf($format, $group_ip, $origin_ip, $iif_s, $oif_s, 
                       $pkts, $bytes_s, $wrong);
            }
        }
    }
}

sub show_mr_intf {
    parse_mr_intf();
}

sub show_mr_mfc {
    parse_mr_cache();
}


#
# main
#

my ($action);

GetOptions("action=s"    => \$action,
          );

die "Must define action\n" if ! defined $action;


show_mr_intf()     if $action eq 'show-mr-intf';

show_mr_mfc()      if $action eq 'show-mr-mfc';

exit 1;

# end of file
