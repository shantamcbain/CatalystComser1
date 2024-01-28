package Comserv::Controller::CSC::Controller::CSC;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }
my $debug = "Comserv::Controller::CSC::Controller::CSC # " . __LINE__ . "\n";

print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package:
" . (caller(1))[0] . "\n";

sub csc :Path('/CSC') {
    my ($self, $c) = @_;
    print $debug. __LINE__. "Calling /CSC in CSC.pm\n";
    $c->stash(template => 'CSC/CSC.tt', layout => 'layout.tt');
    $c->forward($c->view('TT'));  # Render the template
}
sub voip :Path('/voip') {
    my ($self, $c) = @_;
    $c->stash(template => 'CSC/voip.tt');
    $c->forward($c->view('TT'));  # Render the template
}
sub helpdesk :Path('/HelpDesk') {
    my ($self, $c) = @_;
    $c->stash(template => 'CSC/HelpDesk.tt');
    $c->forward($c->view('TT'));  # Render the template
}
__PACKAGE__->meta->make_immutable;

1;
