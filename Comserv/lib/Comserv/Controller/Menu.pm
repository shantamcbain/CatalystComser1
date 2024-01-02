package Comserv::Controller::Menu;

use strict;
use warnings;
use base 'Catalyst::Controller';
my $debug = "Comserv::Controller::Menu Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

sub main :Path :Args(0) {
    my ($self, $c) = @_;
    print $debug . __LINE__ . " in main\n";

    my @main_links = $c->model('DB')->get_links('Main');
    print $debug . __LINE__ . " main_links: @main_links\n";
    my @login_links = $c->model('DB')->get_links('Login');

    my @global_links = $c->model('DB')->get_links('Global');
    my @hosted_links = $c->model('DB')->get_links('Hosted');
    my @member_links = $c->model('DB')->get_links('Member');

    $c->session(
        main_links => \@main_links,
        login_links => \@login_links,
        global_links => \@global_links,
        hosted_links => \@hosted_links,
        member_links => \@member_links,
        template => 'menu/main.tt2',
    );
}
sub edit_link :Path('/edit_link') :Args(1) {
    my ($self, $c, $link_id) = @_;

    # Fetch the link data from the database
my $link = $c->model('DB')->get_record_by_id($c, 'shanta_forager', 'internal_links_tb', 'record_id', $link_id);
    # Stash the link data
    $c->stash(link => $link);

    # Forward to the edit_link.tt template
    $c->stash(template => 'Navigation/edit_link.tt');
    $c->forward($c->view('TT'));
}
# Modify link route
# Confirm modification route
sub confirm_modification :Path('/modify_link') :Args(1) {
    my ($self, $c, $link_id) = @_;

    # Stash the link_id
    $c->stash(link_id => $link_id);

    # Forward to the confirm_modification.tt template
    $c->stash(template => 'Navigation/confirm_modification.tt');
    $c->forward($c->view('TT'));
}
# Confirm delete route
sub confirm_delete :Path('/confirm_delete') :Args(1) {
    my ($self, $c, $link_id) = @_;

    # Stash the link_id
    $c->stash(link_id => $link_id);

    # Forward to the confirm_delete.tt template
    $c->stash(template => 'Navigation/confirm_delete.tt');
    $c->forward($c->view('TT'));
}
1;