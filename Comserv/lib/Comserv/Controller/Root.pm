package Comserv::Controller::Root;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use JSON::MaybeXS qw(encode_json);
BEGIN { extends 'Catalyst::Controller' }

sub stash_dump {
    my ($self, $c) = @_;
#    print Dumper($c->stash);
}


my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
Comserv::debug_log($debug . __LINE__ . " Enter Root\n");

my $site_name = 'home';
__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ($self, $c) = @_;

    # Get the site name from the session
    my $site_name = $c->session->{SiteName};

    # Check the site name and set the template accordingly
    if ($site_name eq 'SunFire') {
        $c->stash(template => 'SunFire/SunFire.tt');
    } elsif ($site_name eq 'BMaster') {
        $c->stash(template => 'BMaster/BMaster.tt');
    } elsif ($site_name eq 'CSC') {
        $c->stash(template => 'CSC/CSC.tt');
    } elsif ($site_name eq 'Shanta') {
        $c->stash(template => 'Shanta/Shanta.tt');
    }elsif ($site_name eq 'WB') {
        $c->stash(template => 'Shanta/WB.tt');
    }
    elsif ($site_name eq 'USBM') {
        $c->stash(template => 'USBM/USBM.tt');
    } elsif ($site_name eq 've7tit') {
        $c->stash(template => 'Shanta/ve7tit.tt');
    } else {
        # Set the template for the default home page
        $c->stash(template => 'home.tt');
    }

    # Forward to the view
    $c->forward($c->view('TT'));
}

sub auto :Private {
    my ($self, $c) = @_;

    # Set the default group in the session if it's not already set
    $c->session->{group} ||= 'normal';

    # Get the domain name from the request
    my $domain = $c->request->uri->host;
    $c->session->{Domain} = $domain;

    # Check the domain and set the site accordingly
    if ($domain =~ /sunfire\.computersystemconsulting\.ca$/ || $domain =~ /sunfiresystems\.ca$/) {
        $c->stash->{SiteName} = 'SunFire';
        $c->session->{SiteName} = 'SunFire';
    } elsif ($domain =~ /computersystemconsulting\.ca$/|| $domain =~
        /CSC$/) {
        $c->stash->{SiteName} = 'CSC';
        $c->session->{SiteName} = 'CSC';
    } elsif ($domain =~ /shanta\.computersystemconsulting\.ca$/|| $domain =~ /shanta\.weaverbeck\.com$/ || $domain =~
        /Shanta$/) {
        $c->stash->{SiteName} = 'Shanta';
        $c->session->{SiteName} = 'Shanta';
    } elsif ($domain =~ /BMaster\.computersystemconsulting\.ca$/ || $domain =~ /beemaster\.ca$/ || $domain =~ /BMaster$/) {
        $c->stash->{SiteName} = 'BMaster';
        $c->session->{SiteName} = 'BMaster';
    } elsif ($domain =~ /usbm\.computersystemconsulting\.ca$/ || $domain =~ /usbm\.ca$/ || $domain =~ /USBM$/) {
        $c->stash->{SiteName} = 'USBM';
        $c->session->{SiteName} = 'USBM';
    } elsif ($domain =~ /weaverbeck\.weaverback\.ca$/ || $domain =~ /vet7tit\.com$/ || $domain =~
        /veytit$/) {
        $c->stash->{SiteName} = 'WB';
        $c->session->{SiteName} = 'WB';
    } elsif ($domain =~ /weaverbeck\.computersystemconsulting\.ca$/ || $domain =~ /weaverbeck\.com$/ || $domain =~
        /WB$/) {
        $c->stash->{SiteName} = 'WB';
        $c->session->{SiteName} = 'WB';
    }
    elsif ($domain =~ /0.0.0.0 $/ || $domain =~ /home$/ || $domain =~ /USBM$/) {
        $c->stash->{SiteName} = 'home';
        $c->session->{SiteName} = 'home';
    }
    # Get the site name from the URL
    my $site_name = $c->req->param('site');
    if (defined $site_name) {
        # If site name is defined in the URL, update the session and stash
        $c->stash->{SiteName} = $site_name;
        $c->session->{SiteName} = $site_name;
    } else {
        # If site name is not defined in the URL, use the session or stash value, or default to 'home'
        $site_name = $c->session->{SiteName} || $c->stash->{SiteName} || 'home';
        $c->stash->{SiteName} = $site_name;
        $c->session->{SiteName} = $site_name;
    }

    # Get the debug parameter from the URL
    my $debug_param = $c->req->param('debug');
    # If the debug parameter is defined
    if (defined $debug_param) {
        # If the debug parameter is different from the session value
        if ($c->session->{debug_mode} ne $debug_param) {
            # Store the new debug parameter in the session and stash
            $c->session->{debug_mode} = $debug_param;
            $c->stash->{debug_mode} = $debug_param;
        }
    } elsif (defined $c->session->{debug_mode}) {
        # If the debug parameter is not defined but there is a value in the session
        # Store the session value in the stash
        $c->stash->{debug_mode} = $c->session->{debug_mode};
    }

    # Set the HostName in the stash
    $c->stash->{HostName} = $c->request->base;

    # Set the Domain in the session
    $c->session->{Domain} = $domain;

    # In your Comserv::Controller::Root controller
    if (ref($c) eq 'Catalyst::Context') {
        my @main_links = $c->model('DB')->get_links($c, 'Main');
        my @login_links = $c->model('DB')->get_links($c, 'Login');
        my @global_links = $c->model('DB')->get_links($c, 'Global');
        my @hosted_links = $c->model('DB')->get_links($c, 'Hosted');
        my @member_links = $c->model('DB')->get_links($c, 'Member');

        $c->session(
            main_links => \@main_links,
            login_links => \@login_links,
            global_links => \@global_links,
            hosted_links => \@hosted_links,
            member_links => \@member_links,
        );
    }

    return 1;
}
sub css_form :Path('/css_form') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
     $c->stash(template => 'css_form.tt');
    $c->forward($c->view('TT'));

}
sub debug :Path('/debug') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";
     $c->stash(template => 'debug.tt');
    $c->forward($c->view('TT'));

}
sub display_schema :Local {
    my ($self, $c) = @_;

    # Call the create_or_update_schema method to create or update the schema
    $c->model('DB')->create_or_update_schema($c);  # Ensure $c is being passed here

    # Retrieve the schema information
    my $schema_info = $c->model('DB')->shanta_forager_schema->get_schema_info($c);

    # Store the schema information in the stash
    $c->stash(schema_info => $schema_info);

    # Set the template
    $c->stash(template => 'setup/display_schema.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub get_tables {
    my ($self, $c, $database) = @_;

    # Retrieve the DBI handle
    my $dbh = $self->_build_dbh($c);

    # Check if the DBI handle is defined
    if (!defined $dbh) {
        print $debug . __LINE__ . " Error: Failed to connect to the database\n";
        return;
    }

    # Prepare the query to retrieve the list of tables
    my $sth = $dbh->prepare("SHOW TABLES IN `$database`");
    $sth->execute();

    # Fetch the results
    my @tables;
    while (my $row = $sth->fetchrow_arrayref) {
        push @tables, $row->[0];
    }

    return \@tables;
}
sub multi_site :Path('/multi_site') :Args(0) {
    my ($self, $c) = @_;

    # Set the template
    $c->stash(template => 'setup/multi_site.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub show_tables_post :Path('/show_tables') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the selected database from the body parameters
    my $database = $c->request->body_parameters->{database};

    # Check if the database is defined
    if (!defined $database) {
        $c->stash(error_message => 'No database specified.');
        return;
    }

    # Retrieve the list of tables
    my $tables = $c->model('DB')->get_tables($c, $database);

    # Check if the tables are defined
    if (!defined $tables) {
        $c->stash(error_message => 'Failed to retrieve the list of tables.');
        return;
    }

    # Store the database name and list of tables in the stash
    $c->stash(database => $database);
    $c->stash(tables => $tables);

    # Set the template
    $c->stash(template => 'show_tables.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub show_tables_post :Path('/show_tables') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the selected database from the body parameters
    my $database = $c->request->body_parameters->{database};

    # Check if the database is defined
    if (!defined $database) {
        $c->stash(error_message => 'No database specified.');
        return;
    }

    # Retrieve the list of tables
    my $tables = $c->model('DB')->get_tables($c, $database);

    # Check if the tables are defined
    if (!defined $tables) {
        $c->stash(error_message => 'Failed to retrieve the list of tables.');
        return;
    }

    # Store the database name and list of tables in the stash
    $c->stash(database => $database);
    $c->stash(tables => $tables);

    # Set the template
    $c->stash(template => 'setup/tables.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}

sub search_schema :Path('/search_schema') :Args(0) {
    my ($self, $c) = @_;
    Comserv::debug_log($debug . __LINE__ . " Enter search_schema\n");
    print $debug . __LINE__ . " Enter search_schema\n";
    Comserv::debug_log($debug . __LINE__ . " Call get_schema_info\n");

    # Redirect to the setup method
    $c->detach('setup');
}
sub display_sorted_tables :Path('/display_sorted_tables') :Args(0) {
    my ($self, $c) = @_;

    # Get the table name from the request parameters
    my $table_name = $c->request->params->{table_name};

    # Get the sorted tables from the DB model
    my $sorted_tables = $c->model('DB')->sort_tables($c, $table_name);

    # Store the sorted tables in the stash
    $c->stash(sorted_tables => $sorted_tables);

    # Set the template
    $c->stash(template => 'setup.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}
sub generate_new_key :Path('/generate_new_key') :Args(0) {
    my ($self, $c) = @_;

    # Create an instance of the DB model
    my $DB = $c->model('DB');

    # Generate a new encryption key
    my $new_key = $DB->_generate_random_key();
    print $debug. __LINE__. " env Masterkey Key: $ENV{MASTER_KEY}\n";
    # Save the new key to the encrypted_dbi_data.dat file
    $DB->_save_encrypted_dbi_info($new_key, $ENV{MASTER_KEY});

    # Redirect the user back to the original page
    $c->response->redirect($c->uri_for('/'));
}
sub default :Path {
    my ($self, $c) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}
sub setup :Path('/setup') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the list of databases from the dbi_info attribute
    my $databases = [keys %{$c->model('DB')->dbi_info}];

    # Store the list of databases in the stash
    $c->stash(databases => $databases);

    # Set the template
    $c->stash(template => 'setup.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}

__PACKAGE__->meta->make_immutable;

1;