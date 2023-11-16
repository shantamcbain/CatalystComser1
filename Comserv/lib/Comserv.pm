package Comserv;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.  See
# Catalyst::Plugin::ConfigLoader for more details.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    StackTrace
    Session
    Session::Store::FastMmap
    Session::State::Cookie
/;

extends 'Catalyst';

our $VERSION = '0.01';
my $debug = "Comserv Line #";

print $debug . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller
    (1))[0] . "\n";

# Configure the application.
#
# Note that settings in comserv.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Comserv',
    root => Comserv->path_to('root')->stringify,
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1,
    encoding => 'UTF-8',
    'View::TT' => {
        WRAPPER => 'layout.tt',
        TEMPLATE_EXTENSION => '.tt',
    },
    'Controller::BMaster' => { path => '/BMaster' },
    'Controller::CSC' => { path => '/CSC' },
    'Controller::USBM' => { path => '/USBM' },
    'Controller::ToDo' => { path => '/todo' },
    'Controller::Root' => {
        css_form => '/css_form',
    },
       'Model::Todo' => {
        class => 'Comserv::Model::Todo',
    },
    'Plugin::Static::Simple' => {
        dirs => [
            'static',
            qr/^(images|js|css)/,
        ],
        ignore_extensions => [ qw/ tt tt2 / ],
    },
    'Model::CssForm' => {
           class => 'Comserv::Model::CssForm',
       },
);
sub home :Path :Args(0) {
    my ($self, $c) = @_;

    # Get the domain name from the request
    my $domain = $c->request->uri->host;
    $c->session->{Domain} = $domain;

    # Get the debug parameter from the URL
    my $debug_param = $c->req->param('debug');
    $c->stash->{debug} = $debug_param;

    # Get the site name from the URL
    my $site_name = $c->req->param('site');
    $c->stash->{SiteName} = $site_name;

    # Set the appropriate controller based on the site name
    my $controller;
    if ($site_name eq 'CSC') {
        $controller = 'CSC';
    } elsif ($site_name eq 'USBM') {
        $controller = 'USBM';
    } elsif ($site_name eq 'BMaster') {
        $controller = 'BMaster';
    }

    # Set the appropriate template based on the controller
    my $template;
    if ($controller) {
        $c->stash->{controller} = $controller;
        $template = lc($controller) . '/home.tt';
    } else {
        # If the site name is not recognized, do not display the home.tt template
        $template = '';
    }
    $c->stash->{template} = $template;

    # Set the HostName and SiteName in the stash
    $c->stash->{HostName} = $c->request->base;
    my $hostName = $c->stash->{HostName};
        # Print the value of HostName
    $c->log->debug("HostName: $hostName");
    print "HostName: $hostName\n";
    $c->stash->{SiteName} = $site_name;

    # Set the SiteName and Domain in the session
    $c->session->{SiteName} = $site_name;
    $c->session->{Domain} = $domain;
    print $debug. " SiteName: ". $site_name. ", Domain: ". $domain. "\n";

    $c->forward('View::TT');
}__PACKAGE__->setup();
print join("\n", @INC);
=encoding utf8

=head1 NAME

Comserv - Catalyst based application

=head1 SYNOPSIS

    script/comserv_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Comserv::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
