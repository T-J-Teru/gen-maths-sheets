#!/usr/bin/perl

use warnings;
use strict;
no indirect;
no autovivification;

#========================================================================#

=pod

=head1 NAME

genadd - a quick summary of what genadd does.

=head1 OPTIONS

B<genadd> [-h|--help]

=head1 SYNOPSIS

A full description for genadd has not yet been written.

=cut

#========================================================================#

use lib "$ENV{HOME}/lib";
use GiveHelp qw/usage/;         # Allow -h or --help command line options.
use Carp::Assert;

#========================================================================#

for (my $i = 1; $i < 16; $i++)
{
  my $a = random_in_range (20, 99);
  my $b = random_in_range (10, $a - 10);
  $a = $a - $b;

  assert ($a + $b < 100);
  assert ($a >= 10);
  assert ($b >= 10);

  print "$a + $b = ". ($a + $b)."\n";
}

#========================================================================#

=pod

=head1 METHODS

The following methods are defined in this script.

=over 4

=cut

#========================================================================#

=pod

=item B<random_in_range>

Currently undocumented.

=cut

sub random_in_range {
  my ($low, $high) = @_;

  my $num = (int (rand ($high + 1 - $low))) + $low;

  assert ($num >= $low);
  assert ($num <= $high);

  return $num;
}

#========================================================================#

=pod

=back

=head1 AUTHOR

Andrew Burgess, 04 Nov 2017

=cut
