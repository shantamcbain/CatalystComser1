package Comserv::Controller::Root;
use Moose;
use namespace::autoclean;
use DateTime;

my $debug = "Comserv::Controller::Root Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

=head1 NAME

Comserv::Controller::Root - Root Controller for Comserv

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    $c->stash(template => 'home.tt');
    print $debug. __LINE__. " Site Name: $site_name\n";
}

sub catalyst_help :Path('/catalyst_help') {
    my ($self, $c) = @_;
    $c->response->body($c->welcome_message);
}

=head2 default

Standard 404 error page

=cut

sub css_form :Path('/css_form') {
    my ($self, $c) = @_;
    my $site_name = $c->stash->{SiteName};
    print $debug. __LINE__. " Site Name: $site_name\n";

    # Read the default.css file
    my $css_file = $c->path_to('root', 'static', 'css', 'default.css');
    my $css_content = $css_file->slurp;

    # Extract the values from the CSS content
    my ($body_font_size) = $css_content =~ /body\s*{\s*font-size:\s*(.*?);/;
    my ($body_font_color) = $css_content =~ /body\s*{\s*color:\s*(.*?);/;
    my ($nav_background_color) = $css_content =~ /nav\s*{\s*background-color:\s*(.*?);/;

    # Pass the values to the form template
    $c->stash(
        font_sizes => ['12px', '14px', '16px', '18px', '20px'],
        body_font_size => $body_font_size || '16px',
        body_font_color => $body_font_color || 'black',
        nav_background_color => $nav_background_color || '#ccffff',
        template => 'css_form.tt',
    );

    # Check if the "backup" directory exists, create it if it doesn't
    my $backup_dir = $c->path_to('root', 'static', 'css', 'backup');
    unless (-d $backup_dir) {
        mkdir $backup_dir or die "Failed to create backup directory: $!";
    }

    # Check if today's backup file already exists, create it if it doesn't
    my $backup_file = $c->path_to('root', 'static', 'css', DateTime->now->ymd('') . '_default.css');
    unless (-e $backup_file) {
        $css_file->copy_to($backup_file) or die "Failed to create backup file: $!";
    }

    # Get a list of all backup files with the "date_default.css" format in the name
    my @backup_files = grep { /_\d{8}_default\.css/ } $backup_dir->children;

    # Print the backup directory and files for debugging
    warn "Backup Directory: $backup_dir";
    warn "Backup Files: @backup_files";

    # Pass the backup file list to the form template
    $c->stash(
        backup_files => \@backup_files,
    );

    $c->forward($c->view('TT'));
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

# Other methods ...

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;
1;