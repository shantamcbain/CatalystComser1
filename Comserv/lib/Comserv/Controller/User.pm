package Comserv::Controller::User;

use Moose;
use namespace::autoclean;
BEGIN { push @INC, '/home/shantam/PycharmProjects/CatalystComser1/Comserv/lib'; }
use Comserv::Model::User;
BEGIN { extends 'Catalyst::Controller'; }

my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
Comserv::debug_log($debug . __LINE__ . " Enter Root\n");

# Catalyst Controller
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
        my $user = $c->model('User')->get_user($username);

        # Check the password
        if ($user && $user->check_password($password)) {
            # The username and password are correct
            # Create a user session...
        } else {
            # The username or password is incorrect
            # Handle the error...
        }
    }

    $c->stash(template => 'login.tt');
    $c->forward($c->view('TT'));
}
sub register :Path('/register') Args(0) {
    print $debug . __LINE__ . " in register\n";
    Comserv::debug_log($debug . __LINE__ . " in register\n");
    my ($self, $c) = @_;

    # Set the template to use
    $c->stash(template => 'register.tt');

    # Stop further processing and display the template
    $c->detach($c->view('TT'));
}

sub create :Path('/create') Args(0) {
    my ($self, $c) = @_;

    # Check if a database connection has been established
    my $dbh = $c->model('MyDB')->_build_dbh($c);
    if (!$dbh) {
        $c->stash(error_msg => 'Could not connect to the database.');
        $c->stash(template => 'register.tt');
        $c->detach($c->view('TT'));
    }

    # Check if the request method is POST
    if ($c->request->method eq 'POST') {
        # Retrieve the form data
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};
        my $email = $c->request->params->{email};

        # Store the form data in the session
        $c->session->{username} = $username;
        $c->session->{email} = $email;
        $c->session->{password} = $password;

        # Check if the username is already in use
        if ($c->model('User')->find_user($c, $username)) {
            # If the username is already in use, set an error message and redirect back to the registration page
            $c->stash(error_msg => 'Username is already in use.');
            $c->stash(template => 'register.tt');
            $c->detach($c->view('TT'));
        }
    # Pass the Catalyst context object $c to the create method
    my $user = $c->model('User')->create($c, {
        username => $username,
        password => $password,
        email => $email,
    });

    # Check if the create method returns an error message
    if ($user && ref $user ne 'HASH') {
        # If an error message is returned, set an error message and redirect back to the registration page
        $c->stash(error_msg => $user);
        $c->stash(template => 'register.tt');
        $c->detach($c->view('TT'));
    }
        # If the user was created successfully, set a success message in the flash and redirect the user to the login page
        $c->flash(success_msg => 'Thank you for creating an account. You can now log in.');
        $c->session->{success_msg} = 'Welcome to the site, ' . $username . '!';
        $c->response->redirect($c->uri_for('/login'));
    } else {
        # If the request method is not POST, redirect the user to the registration page
        $c->response->redirect($c->uri_for('/register'));
    }
}
# In Comserv::Controller::User
sub login :Path('/login') Args(0) {
    my ($self, $c) = @_;

    # Check if the request method is POST
    if ($c->request->method eq 'POST') {
        # Retrieve the form data
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};

        # Find the user by username
        my $user = $c->model('User')->find_user($c, $username);

        # If the user is not found or the password is incorrect
        if (!$user || !$c->model('User')->check_password($password, $user->{password})) {
            # Set an error message and redirect back to the login page
            $c->stash(error_msg => 'Invalid username or password.');
            $c->stash(template => 'login.tt');
            $c->detach($c->view('TT'));
        }

        # If the username and password are correct, log in the user and redirect to the page the login was called from
        $c->session->{user_id} = $user->{id};
        $c->response->redirect($c->uri_for('/'));
    } else {
        # If the request method is not POST, display the login page
        $c->stash(template => 'login.tt');
    }
   # Forward to the view
    $c->forward($c->view('TT'));
}
1;