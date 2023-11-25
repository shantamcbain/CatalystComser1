package Comserv;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use Catalyst::Runtime 5.80;

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
my $debug = "Comserv Line #";

our $VERSION = '0.02';

our @debug_log_entries; # Array to store the debug log entries

# Define the debug_log method
sub debug_log {
    my ($message) = @_;

    # Check if $message is a hash reference
    if (ref $message eq 'HASH') {
        # Convert the hash to a string using Data::Dumper
        $message = Data::Dumper->Dump([$message], ['*hash']);
    }
    # Get the current date
    my ($sec, $min, $hour, $mday, $mon, $year) = localtime();
    my $date = sprintf("%04d-%02d-%02d %02d:%02d:%02d", $year + 1900, $mon + 1, $mday, $hour, $min, $sec);

    # Open the debug.log file in append mode
    open my $fh, '>>', 'debug.log' or die "Could not open debug.log: $!";

    # Write the date and message to the file
    print $fh "$date $message\n";

    # Close the file
    close $fh;

    # Store the message in the debug_log_entries array
    push @debug_log_entries, "$date $message";
}

# Override the log method to use debug_log
around 'log' => sub {
    my $orig = shift;
    my $self = shift;

    # Call the original log method
    my $log = $self->$orig(@_);

    # Use debug_log for debug messages
    if ($log && $log->is_debug) {
        $self->debug_log(join("\n", @_));
    }

    return $log;
};
# Define a method to retrieve a specific debug log entry
sub get_debug_entry {
    my ($index) = @_;
    return $debug_log_entries[$index];
}
# Define a method to retrieve a specific debug log entry
sub get_debug_log_entry {
    my ($index) = @_;
    return $debug_log_entries[$index];
}
# Use debug_log instead of print
Comserv::debug_log($debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0]);

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

sub setup {
    Comserv::debug_log($debug . __LINE__ . " Enter setup");
    my $self = shift;

    # Call the parent setup method
    $self->SUPER::setup(@_);

    # Get the MyDB model
    Comserv::debug_log($debug . __LINE__ . " Enter MyBD model");

    # Get the DBI info
    Comserv::debug_log($debug . __LINE__ . " Enter dbi_info");

    # Print the include path
    Comserv::debug_log(join("\n", @INC));
}

# Other methods...

__PACKAGE__->setup();
Comserv::debug_log(join("\n", @INC));

# Make the class immutable after all methods have been added or modified
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;