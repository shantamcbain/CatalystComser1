package Comserv;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
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
/;

extends 'Catalyst';

our $VERSION = '0.01';

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
    'Controller::BMaster' => { path => '/BMaster' },
    'Controller::CSC' => { path => '/CSC' },
    'Controller::USBM' => { path => '/USBM' },
    },
);
sub bmaster :Path('/BMaster') {
    my ($self, $c) = @_;
    print "Calling /BMaster in Comserv.pm\n";  # Add this print statement
    $c->stash(template => 'BMaster/BMaster.tt', layout => 'layout.tt');
    $c->forward('Comserv::View::TT');  # Render the template
}
# Start the application
__PACKAGE__->setup();

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
