package Comserv::Model::CssForm;
use Moose;
use namespace::autoclean;
extends 'Catalyst::Model';

has 'color' => (is => 'rw', isa => 'Str', default => 'blue');
has 'font_size' => (is => 'rw', isa => 'Str', default => '16px');
has 'background_color' => (is => 'rw', isa => 'Str', default => '#ccffff');
has 'nav_background_color' => (is => 'rw', isa => 'Str', default => '#ccffff');

__PACKAGE__->meta->make_immutable;

1;

sub BUILD {
    my $self = shift;
    print "Debug: Creating instance of Comserv::Model::CssForm\n";
    # Add any additional initialization code here
}

__PACKAGE__->meta->make_immutable;
1;