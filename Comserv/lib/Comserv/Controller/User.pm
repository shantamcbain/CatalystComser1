package Comserv::Controller::User;

use Moose;
use namespace::autoclean;
BEGIN { push @INC, '/home/shantam/PycharmProjects/CatalystComser1/Comserv/lib'; }

BEGIN { extends 'Catalyst::Controller'; }

my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
print $debug . __LINE__ . " Enter auto\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");
#  Catalyst Controller
__PACKAGE__->config();

sub index :Path : Args(0) {
    my ($self, $c) = @_;

    # Retrieve all of the user records as user model objects and store in the stash
    $c->stash(users => [$c->model('DB::User')->all]);

    # Set the TT template to use
    $c->stash(template => 'users/list.tt');
}
sub login :Path('/login') :Args(0) {
    my ($self, $c) = @_;

    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};

        # Retrieve the user from the database
        my $user = $c->model('DB')->get_user_by_username($username);

        if ($user) {
            # Hash the provided password
            my $hashed_password = $c->model('DB')->hash_password($password);

            # Compare the hashed password with the stored password
            if ($hashed_password eq $user->{password}) {
                # The username and password are correct
                # Create a user session
                $c->session(user_id => $user->{id});
                $c->session(username => $user->{username});
                $c->response->redirect($c->uri_for('/'));
            } else {
                # The password is incorrect
                $c->stash(error_msg => 'Invalid password. Please re-enter your password or click "Change Password" to reset it.');
            }
        } else {
            # The username is incorrect
            $c->stash(error_msg => 'Invalid username. Did you type it wrong or you don\'t have an account? Please click "Register" to create an account.');
        }

        $c->stash(template => 'user/login.tt');
        $c->forward($c->view('TT'));
    } else {
        $c->stash(template => 'user/login.tt');
        $c->forward($c->view('TT'));
    }
}sub change_password :Path('/change_password') :Args(0) {
    my ($self, $c) = @_;

    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $new_password = $c->request->params->{new_password};

        # Retrieve the user from the database
        my $user = $c->model('User')->get_user($c, $username);

        if ($user) {
            # Hash the new password
            my $hashed_password = $c->model('DB')->hash_password($new_password);

            # Update the password in the database
            $c->model('User')->change_password($c, $username, $hashed_password);

            $c->stash(success_msg => 'Password changed successfully.');
        } else {
            $c->stash(error_msg => 'User not found.');
        }

        $c->stash(template => 'user/change_password.tt');
        $c->forward($c->view('TT'));
    } else {
        $c->stash(template => 'user/change_password.tt');
        $c->forward($c->view('TT'));
    }
}
sub logout :Path('/logout') :Args(0) { my ($self, $c) = @_;
# Clear the user session
$c->logout;

# Remove user_id and user flag from the session
delete $c->session->{user_id};
delete $c->session->{user_flag};

# Redirect to the home page
$c->response->redirect($c->uri_for('/'));
}
1;