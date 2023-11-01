package Comserv::Controller::CSC::Controller::CSC;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }
my $debug = "Comserv::Controller::CSC::Controller::CSC # " . __LINE__ . "\n";

print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package:
" . (caller(1))[0] . "\n";
=head1 NAME

Comserv::Controller::CSC::Controller::CSC - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut
sub csc :Path('/CSC') {
    my ($self, $c) = @_;
    print $debug. __LINE__. "Calling /CSC in CSC.pm\n";
    $c->stash(template => 'CSC/CSC.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}

sub beekeeping :Path('/Beekeeping') :Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'Root/BMaster/BMaster.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}

sub yards :Path('/yards') :Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'BMaster/yards.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}


=encoding utf8

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
