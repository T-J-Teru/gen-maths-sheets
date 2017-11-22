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

my $output_filename = "sheet.tex";
my $template_filename = "add-template.tex";

open my $out, ">".$output_filename
  or die "Failed to open '$output_filename': $!";

open my $in, $template_filename
  or die "Failed to open '$template_filename': $!";

while (<$in>)
{
  if (m/<ADD-QUESTION>/)
  {
    my $question = generate_add ();
    my $string = $question->{a} ." + ". $question->{b} ." = ";
    s/<ADD-QUESTION>/$string/;
  }

  print $out $_;
}



close $in
  or die "Failed to close '$template_filename': $!";

close $out
  or die "Failed to close '$output_filename': $!";

#========================================================================#

=pod

=head1 METHODS

The following methods are defined in this script.

=over 4

=cut

#========================================================================#

=pod

=item B<generate_add>

Generate an add problem, return a hash reference with keys I<a>, I<b>, and
I<answer>.

=cut

sub generate_add {
  my $a = random_in_range (20, 99);
  my $b = random_in_range (10, $a - 10);
  $a = $a - $b;

  assert ($a + $b < 100);
  assert ($a >= 10);
  assert ($b >= 10);

  return { a => $a, b => $b, answer => ($a + $b) };
}

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
