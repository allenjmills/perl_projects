#!/usr/bin/perl
use strict;
use warnings;

use WebService::Belkin::WeMo::Discover;
use WebService::Belkin::WeMo::Device;

my $wemoDiscover = WebService::Belkin::WeMo::Discover->new();

# Perfrom UPNP Search for all Belkin WeMo switches
my $discovered = $wemoDiscover->search();

# Save device info to make API calls faster - eliminates search on startup
#
# Load from storage
#my $discovered = $wemoDiscover->load("/etc/belkin.db");

foreach my $ip (keys %{$discovered}) {
	print "IP = $ip\n";
	print "Friendly Name = $discovered->{$ip}->{'name'}\n";
}