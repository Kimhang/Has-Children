#!/usr/bin/env perl

use strict;
use warnings;
use lib '../Has-Children/lib';
require Sorter;
use IO::File;
use Data::Printer;

sub main {
    my $file = IO::File->new($ARGV[0], 'r');

    my $self = Sorter->new( data => [] );
    while (my $line = $file->getline) {
        if ( $line =~ m/(?<num>\d+).(?<child>\d+)/g ) {
            my $data = Sorter->new(
                num => "$+{num}",
                child => "$+{child}",
            );
            $self->set_parent($data);
        }
    }

    p $self;

    $file->close;
}

main();
