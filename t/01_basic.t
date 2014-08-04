use strict;
use warnings;
use utf8;
use Test::More;
use BinarySearch::Tiny;

is binary_search([], sub {}), undef;

subtest 'numbers' => sub {
    my $target = 100;
    my $val = binary_search([0..255], sub {
        my @l = @_;
        return $target <= $l[-1];
    });
    is $val, 100;
};

subtest 'exponent numbers' => sub {
    my $target = 4096;
    my $val = binary_search([map { 2 ** $_ } 1..20], sub {
        my @l = @_;
        return $target <= $l[-1];
    });
    is $val, 4096;
};

subtest 'characters' => sub {
    is binary_search(['a'], sub {}), 'a';

    my $target = 'blind';

    my $got = '';
    for my $i (0..4) {
        my $c = binary_search(['a'..'z'], sub {
            my $pattern = join '', @_;
            $pattern = qr/[$pattern]/;
            return substr($target, $i, 1) =~ $pattern;
        });
        if (defined $c) {
            $got .= $c;
        } else {
            last;
        }
    }

    is $got, $target;
};

done_testing;
