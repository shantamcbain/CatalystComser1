package Comserv::Controller::admin;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub edit_admin_notes :Path('edit_admin_notes') :Args(0) {
    my ( $self, $c ) = @_;

    # Print the contents of the session
    use Data::Dumper;
    print Dumper($c->stash);

    # Retrieve the admin notes from the database
    my $dbh = $c->stash->{dbi};

    # Check if $dbh is defined
    if (defined $dbh) {
        print "DBI is defined\n";
    } else {
        print "DBI is not defined\n";
    }

    my $sth = $dbh->prepare("SELECT body FROM page_tb WHERE page_code = 'SiteAdminNotes' AND sitename = ?");
    $sth->execute($c->session->{SiteName});

    my $body = $sth->fetchrow_array;

    # Pass the body to the template
    $c->stash(body => $body);
    $c->stash(template => 'todo/edit_admin_notes.tt');

    # Render the template
    $c->forward( $c->view('TT') );
}
sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Comserv::Controller::admin in admin.');
}

sub submit_admin_notes {
    my $self = shift;
    my $body = $self->param('body');

    # Validate the input...

    # Update the admin notes in the database
    my $dbh = $self->session->{dbi};
    my $sth = $dbh->prepare("UPDATE page_tb SET body = ? WHERE page_code = 'SiteAdminNotes' AND sitename = ?");
    $sth->execute($body, $self->session->{SiteName});
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
