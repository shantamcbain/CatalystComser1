package Comserv::Controller::UserController;

use strict;
use warnings;
use base 'Catalyst::Controller';

sub edit_user :Path('/edit_user') :Args(1) {
    my ($self, $c, $user_id) = @_;

    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $roles = $c->request->params->{roles};

        # Update the user data in the database
        my $user = $c->model('DB::Ency::User')->find($user_id);
        if ($user) {
            $user->update({
                username => $username,
                roles => $roles,
            });

            # Redirect to the previous page with a success message
            $c->flash->{message} = 'User updated successfully';
            $c->response->redirect($c->request->referer || '/');
        } else {
            # Redirect to the previous page with an error message
            $c->flash->{error} = 'User not found';
            $c->response->redirect($c->request->referer || '/');
        }
    } else {
        # Fetch the user data from the database
        my $user = $c->model('DB::Ency::User')->find($user_id);

        # Stash the user data
        $c->stash(user => $user);

        # Forward to the edit_user.tt template
        $c->stash(template => 'user/edit_user.tt');
        $c->forward($c->view('TT'));
    }
}
sub list_users :Path('/list_users') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve all users from the database
    my @users = $c->model('DB::Ency::User')->all;

    # Store the users in the stash
    $c->stash(users => \@users);

    # Set the template
    $c->stash(template => 'user/list_users.tt');
    $c->forward($c->view('TT'));
}

1;