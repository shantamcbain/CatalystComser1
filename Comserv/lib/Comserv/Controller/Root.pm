package Comserv::Controller::Root;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use JSON::MaybeXS qw(encode_json);
use Template;
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
    my ($self, $context) = @_;

    # Get the site name from the session
    my $site_name = $context->session->{SiteName};

    # Define a hash to map site names to templates
    my %site_to_template = (
        'SunFire' => 'SunFire/SunFire.tt',
        'BMaster' => 'BMaster/BMaster.tt',
        'Brew'    => 'Brew/Brew.tt',
        'CSC' => 'CSC/CSC.tt',
        'Dev' => 'dev/index.tt',
        'Forager' => 'Forager/Forager.tt',
        'Monashee' => 'Monashee/Monashee.tt',
        'Shanta' => 'Shanta/Shanta.tt',
        'WB' => 'Shanta/WB.tt',
        'USBM' => 'USBM/USBM.tt',
        've7tit' => 'Shanta/ve7tit.tt',
        'home' => 'home.tt',
    );

    # Check if the site name exists in the hash
    if (exists $site_to_template{$site_name}) {
        # If it does, use the corresponding template
        $context->stash(template => $site_to_template{$site_name});
    } else {
        # If it doesn't, default to 'index.tt'
        $context->stash(template => 'index.tt');
    }

    # Forward to the view
    $context->forward($context->view('TT'));
}
sub auto :Private {
    my ($self, $c) = @_;

    # Set the default group in the session if it's not already set
    $c->session->{group} ||= 'normal';

    # Get the domain name from the request
    my $domain = $c->request->uri->host;
    $c->session->{Domain} = $domain;

    # Get the site name from the URL
    my $site_name = $c->req->param('site');
    if (defined $site_name) {
        # If site name is defined in the URL, update the session and stash
        $c->stash->{SiteName} = $site_name;
        $c->session->{SiteName} = $site_name;
    }
    elsif (defined $c->session->{SiteName}) {
        # If site name is not defined in the URL but is defined in the session, use the session value
        $c->stash->{SiteName} = $c->session->{SiteName};
    }
    else {
        # If site name is not defined in the URL or the session, check the domain and set the site accordingly
        if ($domain =~ /sunfire\.computersystemconsulting\.ca$/
            || $domain =~ /sunfiresystems\.ca$/) {
            $c->stash->{SiteName} = 'SunFire';
            $c->session->{SiteName} = 'SunFire';
        }
        elsif ($domain =~ /computersystemconsulting\.ca$/
            || $domain =~ /CSC$/) {
            $c->stash->{SiteName} = 'CSC';
            $c->session->{SiteName} = 'CSC';
        }
        elsif ($domain =~ /shanta\.computersystemconsulting\.ca$/
            || $domain =~ /shanta\.weaverbeck\.com$/ || $domain =~ /Shanta$/) {
            $c->stash->{SiteName} = 'Shanta';
            $c->session->{SiteName} = 'Shanta';
        }
        elsif ($domain =~ /dev\.computersystemconsulting\.ca$/ || $domain =~ /Dev$/) {
            $c->stash->{SiteName} = 'CSCDev';
            $c->session->{SiteName} = 'CSCDev';
        }
        elsif ($domain =~ /forager\.com$/ || $domain =~ /Forager$/) {
            $c->stash->{SiteName} = 'Forager';
            $c->session->{SiteName} = 'Forager';
        }
        elsif ($domain =~ /monashee\.computersystemconsulting\.ca$/
            || $domain =~ /Monashee$/) {
            $c->stash->{SiteName} = 'Monashee';
            $c->session->{SiteName} = 'Monashee';
        }
        elsif ($domain =~ /brew\.computersystemconsulting\.ca$/
            || $domain =~ /brew\.weaverbeck\.com$/ || $domain =~ /Brew$/) {
            $c->stash->{SiteName} = 'Brew';
            $c->session->{SiteName} = 'Brew';
        }
        elsif ($domain =~ /usbm\.computersystemconsulting\.ca$/
            || $domain =~ /usbm\.ca$/ || $domain =~ /USBM$/) {
            $c->stash->{SiteName} = 'USBM';
            $c->session->{SiteName} = 'USBM';
        }
        elsif ($domain =~ /weaverbeck\.computersystemconsulting\.ca$/
            || $domain =~ /weaverbeck\.com$/ || $domain =~ /WB$/) {
            $c->stash->{SiteName} = 'WB';
            $c->session->{SiteName} = 'WB';
        }
        elsif ($domain =~ /ve7tit\.weaverbeck\.com$/ || $domain =~ /ve7tit\.com$/ || $domain =~ /ve7tit$/) {
            $c->stash->{SiteName} = 've7tit';
            $c->session->{SiteName} = 've7tit';
        }
        elsif ($domain =~ /home$/ || $domain =~ /home/) {
            $c->stash->{SiteName} = 'home';
            $c->session->{SiteName} = 'home';
        }
        else {
            # If the domain does not match any condition, set SiteName to 'none'
            $c->stash->{SiteName} = 'none';
            $c->session->{SiteName} = 'none';
        }
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

    my $page = $c->req->param('page');
    # If the debug parameter is defined
    if (defined $page) {
        # If the debug parameter is different from the session value
        if ($c->session->{page} ne $page) {
            # Store the new debug parameter in the session and stash
            $c->session->{page} = $page;
            $c->stash->{page} = $page;
        }
    } elsif (defined $c->session->{page}) {
        # If the debug parameter is not defined but there is a value in the session
        # Store the session value in the stash
        $c->stash->{page} = $c->session->{page};
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
    my $schema_info = $c->model('DB::ShantaForager')->get_schema_info($c);

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
sub setup :Pathsub setup :Path('/setup') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the list of databases from the dbi_info attribute
    my $databases = [keys %{$c->model('DB')->dbi_info}];

    # Store the list of databases in the stash
    $c->stash(databases => $databases);

    # Get the domain name from the request
    my $domain = $c->request->uri->host;
    $c->session->{Domain} = $domain;

    # Determine the site-specific content
    my $site_name = $c->stash->{SiteName};
    my $site_content;
    # Define the Template Toolkit object and variables outside the conditional block
    my $output = '';
    my $template = Template->new();
    my $vars = {
        SiteName => $site_name,
    };

    if ($site_name eq 'BMaster') {
        $site_content = 'BMaster content in root setup';
    }
    elsif ($site_name eq 'CSC') {
        my $template_content = "<h2>[% SiteName %]</h2>
        <ol>
<li>
    Install and setup server to deliver Catalyst application:
    <ol>
        <li>Install a web server that supports PSGI, such as Starman: Use the command `cpanm Starman`.To install and setup Starman using cPanel, you can follow these steps:
 <ol>
        <li>Log into your cPanel account.</li>
        <li>Navigate to the \"Perl Modules\" section under the \"Software\" category.</li>
        <li>In the \"Perl Modules\" section, you can install new Perl modules. In the \"Install a Perl Module\" box, type `Starman` and click on \"Install Now\".</li>
        <li>After the installation is complete, you will see a confirmation message.</li>
    </ol>
        <li>Create a PSGI file for your Catalyst application. This file tells the web server how to run your application.</li>
        <li>Configure your web server to use the PSGI file. For Starman, you can run your application with the command: `starman --listen :5000 myapp.psgi`.</li>
        <li>Pull the latest release version from your GitHub repository using the command: `git pull origin master`.</li>
        <li>Restart your web server to apply the updates. For Starman, you can use `pkill starman` to stop the server, and then use the `starman` command to start it again.</li>
    </ol>
</li>
            <li>install and Setup server to deliver catalyst application.</li>
            in root setup steps we are working on";
        $template->process(\$template_content, $vars, \$output) || die $template->error();
        $site_content = $output;}
     elsif ($site_name eq 'Monashee') {
        my $template_content = "<h2>[% SiteName %]</h2>
        <ol>
<li>Create script to search files for documents and place them in a csv document for manipulation.

    <ol>
        <li>Search drive for all documents and store in a currently underdevelopment.</li>
        <li></li>
        <li> </li>
        <li></li>
    </ol>
        <li>Create table that will store all the files in a database.</li>
        <li>Create a password management system for storing all passwords for the coop </li>
        <li>Create a system to update prices in Square start with spreadsheet but move to an application that can
        automatialy update prices in Square.</li>
        <li></li>
    </ol>
</li>
            <li></li>
            ";
        $template->process(\$template_content, $vars, \$output) || die $template->error();
        $site_content = $output;
   } else {
        $site_content = 'Default content';
    }

    # Store the site-specific content in the stash
    $c->stash(site_content => $site_content);

    # Set the template
    $c->stash(template => 'setup.tt');

    # Forward to the view
    $c->forward($c->view('TT'));
}


__PACKAGE__->meta->make_immutable;

1;