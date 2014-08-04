# NAME

BinarySearch::Tiny - tiny binary search

# SYNOPSIS

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

# DESCRIPTION

BinarySearch::Tiny is ...

# LICENSE

Copyright (C) Takumi Akiyama.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Takumi Akiyama <t.akiym@gmail.com>
