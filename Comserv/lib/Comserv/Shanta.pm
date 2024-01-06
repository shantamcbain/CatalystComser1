package Comserv::Controller::Shanta;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub base :Chained('/') :PathPart('Shanta') :CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'Shanta/Shanta.tt');
    $c->forward($c->view('TT'));
}

sub index :Chained('base') :PathPart('') :Args(0) {
    my ($self, $c) = @_;
    # You can add any additional logic you need for the home page here
}

__PACKAGE__->meta->make_immutable;

1;