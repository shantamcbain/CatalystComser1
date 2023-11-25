package Comserv::Controller::BMaster::Controller::BMaster;
use Moose;
use namespace::autoclean;
BEGIN {
    extends 'Catalyst::Controller';
}
my $debug = "Comserv::Controller::BMaster::Controller::BMaster # " . __LINE__ . "\n";
sub stash_dump {
    my ($self, $c) = @_;
#    print Dumper($c->stash);
}
Comserv::debug_log($debug . __LINE__);
Comserv::debug_log($debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0]);

print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package:
" . (caller(1))[0] . "\n";
=head1 NAME
Comserv::Controller::Beekeeping - Catalyst Controller
=head1 DESCRIPTION
Catalyst Controller.
=head1 METHODS
=head2 index
=cut
sub bmaster :Path('/BMaster') {
    my ($self, $c) = @_;
    print $debug. __LINE__. "Calling /BMaster in BMaster.pm\n";
    $c->stash(template => 'BMaster/BMaster.tt', layout => 'layout.tt');
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

__PACKAGE__->meta->make_immutable;

1;