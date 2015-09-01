package Sorter;

use Moose;
use Data::Printer;

has data => (is => 'rw');
has num => (is => 'ro');
has child => (is => 'ro');

sub set_parent {
    my ($self, $data) = @_;

    push $self->{data}, { num => $data->{num}, children => $data->{child} };

    return $self;
}

1;
