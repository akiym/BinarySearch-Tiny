package BinarySearch::Tiny;
use 5.008005;
use strict;
use warnings;
use parent qw/Exporter/;

our $VERSION = "0.01";

our @EXPORT = qw/binary_search/;

sub binary_search {
    my ($list, $code) = @_;
    return undef if @$list == 0;
    return $list->[0] if @$list == 1;

    my $former = 0;
    my $latter = int(scalar @$list / 2);

    my @former_list = @$list[$former .. $latter - 1];
    if ($code->(@former_list)) {
        return binary_search(\@former_list, $code);
    } else {
        my @latter_list = @$list[$latter .. @$list - 1];
        return binary_search(\@latter_list, $code);
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

BinarySearch::Tiny - tiny binary search

=head1 SYNOPSIS

    use BinarySearch::Tiny;

    my $target = 100;
    my $val = binary_search([0..255], sub {
        my @l = @_;
        return $target <= $l[-1];
    });

    # choose character
    my $target_char = 'P';
    my $c = binary_search([split //, 'HACK THE PLANET'], sub {
        my $pattern = join '', @_;
        $pattern = qr/[$pattern]/;
        return $target_char =~ $pattern;
    });


=head1 DESCRIPTION

BinarySearch::Tiny is ...

=head1 LICENSE

Copyright (C) Takumi Akiyama.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takumi Akiyama E<lt>t.akiym@gmail.comE<gt>

=cut

