package Comserv::BMaster::Controller::BMaster;
use Moose;
use namespace::autoclean;
BEGIN {
    extends 'Catalyst::Controller';
}
my $debug = "Comserv::BMaster::Controller::BMaster # " . __LINE__ . "\n";

print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package:
" . (caller(1))[0] . "\n";
=head1 NAME
Comserv::Controller::Beekeeping - Catalyst Controller
=head1 DESCRIPTION
Catalyst Controller.
=head1 METHODS
=head2 index
=cut
sub index :Path :Args(0) {
    my ($self, $c) = @_;
     $c->response->body('Matched Comserv::BMaster::Controller::BMaster in BMaster.');
}
sub beekeeping :Path('/BMaster') :Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'Root/BMaster/BMaster.tt', layout => 'layout.tt');
}

sub yards :Path('/yards') :Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'BMaster/yards.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}
=head1 AUTHOR
Shanta McBain
=head1 LICENSE
This library is free software. You can redistribute it and/or modify it under the same terms as Perl itself.
=cut
__PACKAGE__->meta->make_immutable;
1;