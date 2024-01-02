package Comserv::Controller::User;

use Moose;
use namespace::autoclean;
use Data::Dumper;
BEGIN { push @INC, '/home/shantam/PycharmProjects/CatalystComser1/Comserv/lib'; }

BEGIN { extends 'Catalyst::Controller'; }

my $debug = "Comserv::Controller::User Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
print $debug . __LINE__ . " Enter auto\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");
#  Catalyst Controller
sub create {
    my ($self, $c, $user_data) = @_;

    # Retrieve the DBI handle
    my $dbh = $c->model('DB')->_build_dbh($c);

    # Prepare the query to create a new user
    my $sth = $dbh->prepare('INSERT INTO users (username, password, email) VALUES (?, ?, ?)');

    # Hash the password
    my $hashed_password = $self->hash_password($user_data->{password});

    # Execute the query
    my $result = $sth->execute($user_data->{username}, $hashed_password, $user_data->{email});

    # Check if the execute method is successful
    if (!$result) {
        # If the execute method fails, return the DBI error message
        return "DBI error: $DBI::errstr";
    }

    # Fetch the created user record
    my $user = $self->find_user($c, $user_data->{username});

    return $user;
}
sub index :Path : Args(0) {
    my ($self, $c) = @_;

    # Retrieve all of the user records as user model objects and store in the stash
    $c->stash(users => [$c->model('DB::User')->all]);

    # Set the TT template to use
    $c->stash(template => 'users/list.tt');
}
sub login :Path('/login') :Args(0) {
    my ($self, $c) = @_;
    print $debug . __LINE__ . " Enter login\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");
    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};

        # Retrieve the user from the database
        my $user = $c->model('DB')->get_user_by_username($c, $username);
 #       print $debug . __LINE__ . " user: " . Dumper($user) . "\n";  # Add this linedebug_log($debug . __LINE__ . "
        # Enter Root\n");
        if ($user) {
            # Retrieve the username, role and hashed password from the user object
            my $username_from_db = $user->username;
            print $debug . __LINE__ . " username_from_db: " . $username_from_db . "\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");
            my $role_from_db = $user->roles;
            print $debug . __LINE__ . " role_from_db: " . $role_from_db . "\n";  # Add this linedebug_log($debug . __LINE__ . " Enter Root\n");
            my $hashed_password_from_db = $user->password;

            # Hash the provided password
            my $hashed_provided_password = $c->model('DB')->hash_password($password);

            # Check if the hashed provided password matches the stored password
            if ($c->model('DB')->check_password($hashed_provided_password, $hashed_password_from_db)) {
                # The username and password are correct
                # Create a user session
                $c->session(user_id => $user->id);
                $c->session(username => $username_from_db);
                $c->session(group => $role_from_db);  # Stash the user's role into the group session variable
                $c->response->redirect($c->uri_for('/'));
            } else {
                # The password is incorrect
                $c->stash(error_msg => 'Invalid password.');
                $c->stash(template => 'user/login.tt');
                $c->forward($c->view('TT'));
            }
        } else {
            # The username is incorrect
            $c->stash(error_msg => 'Invalid username.');
            $c->stash(template => 'user/login.tt');
            $c->forward($c->view('TT'));
        }
    } else {
        $c->stash(template => 'user/login.tt');
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
sub register :Path('/register') :Args(0) {
    my ($self, $c) = @_;

    if ($c->request->method eq 'POST') {
        my $username = $c->request->params->{username};
        my $password = $c->request->params->{password};
        my $email = $c->request->params->{email};

        # Create a new user
        my $user = $self->create($c, {
            username => $username,
            password => $password,
            email => $email
        });

        if ($user) {
            # If the user was successfully created, redirect to the login page
            $c->response->redirect($c->uri_for('/login'));
        } else {
            # If there was an error creating the user, display an error message
            $c->stash(error_msg => 'There was an error creating your account.');
            $c->stash(template => 'user/register.tt');
            $c->forward($c->view('TT'));
        }
    } else {
        $c->stash(template => 'user/register.tt');
        $c->forward($c->view('TT'));
    }
}
1;