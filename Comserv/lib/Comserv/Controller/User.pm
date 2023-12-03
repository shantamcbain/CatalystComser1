package Comserv::Controller::User;

use Moose;
use namespace::autoclean;
BEGIN { push @INC, '/home/shantam/PycharmProjects/CatalystComser1/Comserv/lib'; }

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

    # Print the current working directory
    print "Current working directory: " . Cwd::getcwd() . "\n";

    # Print the configured template directory
    print "Configured template directory: " . $c->config->{'View::TT'}->{INCLUDE_PATH} . "\n";
    if (!-e $c->config->{'View::TT'}->{INCLUDE_PATH} . '/login.tt') {
        print "Template file login.tt does not exist.\n";
    }

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

    $c->stash(template => 'user/login.tt');
    $c->forward($c->view('TT'));
}
sub get_user {
    my ($self, $username) = @_;

    # Print debug information
    print $debug . __LINE__ . " Enter get_user\n";
    Comserv::debug_log($debug . __LINE__ . " Enter get_user\n");
    print $debug . __LINE__ . " Username: $username\n";
    Comserv::debug_log($debug . __LINE__ . " Username: $username\n");

    # Retrieve the user from the database
    my $user = $self->resultset('User')->find({ username => $username });

    # Check if the user was found
    if ($user) {
        print $debug . __LINE__ . " User found: " . Dumper($user) . "\n";
        Comserv::debug_log($debug . __LINE__ . " User found: " . Dumper($user) . "\n");
    } else {
        print $debug . __LINE__ . " User not found\n";
        Comserv::debug_log($debug . __LINE__ . " User not found\n");
    }

    return $user;
}
sub check_password {
    my ($self, $c, $username, $password) = @_;

    # Retrieve the user from the database
    my $user = $self->find_user($username);

    # If the user doesn't exist, return false
    if (!$user) {
        $c->stash(error_msg => 'User not found.');
        return 0;
    }

    # Compare the passwords
    if ($password eq $user->password) {
        # The passwords match
        return 1;
    } else {
        # The passwords don't match
        $c->stash(error_msg => 'Invalid password.');
        return 0;
    }
}
sub register :Path('/register') Args(0) {
    print $debug . __LINE__ . " in register\n";
    Comserv::debug_log($debug . __LINE__ . " in register\n");
    my ($self, $c) = @_;
    $c->session->{return_url} = $c->req->uri;
    # Set the template to use
    $c->stash(template => 'register.tt');

    # Stop further processing and display the template
    $c->detach($c->view('TT'));
}

sub create :Path('/create') Args(0) {
    my ($self, $c) = @_;

    # Check if a database connection has been established
    my $dbh = $c->model('DB')->_build_dbh($c);
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