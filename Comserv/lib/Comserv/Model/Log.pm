package Comserv::Model::Log;
use Moose;
use namespace::autoclean;
use IO::Handle;
use DateTime;
use Text::CSV;
extends 'Catalyst::Model';

=head1 NAME

Comserv::Model::Log - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
use IO::Handle;  # Import the IO::Handle module to get the autoflush method

use IO::Handle;  # Import the IO::Handle module to get the autoflush method
use DateTime;    # Import the DateTime module to get the current date and time

sub write_log {
    my ($self, $c, $message) = @_;
    print "Entering write_log\n";
    # Get the SiteName from the session
    my $site_name = $c->session->{SiteName} // 'Unknown Site';

    # Get the current date and time
    my $date = DateTime->now->strftime('%Y-%m-%d %H:%M:%S');

    # Escape any quotes in the message
    $message =~ s/"/""/g;

    # Format the message as a CSV record
    $message = "$date,$site_name,\"$message\"\n";
    my $log_file_path = 'log/logs.csv';

    # Check if the 'log' directory exists, if not create it
    unless (-d 'log') {
        mkdir 'log' or die "Failed to create directory: $!";
    }

    # Open the file
    open my $file_handle, '>>', $log_file_path or die "Could not open file: $!";

    # Autoflush the filehandle
    $file_handle->autoflush(1);

    # Write the message to the file
    print $file_handle $message;

    # Close the file
    close $file_handle;
}


sub get_log_data {
    my ($self, $c) = @_;
    print "Entering get_log_data\n";
    # Get the SiteName from the session
    my $site_name = $c->session->{SiteName} // 'Unknown Site';

    # Define the path to the log file
    my $log_file_path = 'log/logs.csv';

    # Check if the log file exists
    if (-e $log_file_path) {
        # Open the log file
        open my $log_file, '<', $log_file_path or return "Could not open log file: $!";

        # Create a Text::CSV object
        my $csv = Text::CSV->new({ binary => 1 });

        # Read the log data
        my @log_data;
        while (my $row = $csv->getline($log_file)) {
            push @log_data, $row;
        }

        # Close the log file
        close $log_file;

        # Filter the log data based on the SiteName and sort by date
        my @filtered_log_data = sort { $a->[0] cmp $b->[0] } grep { $_->[1] eq $site_name } @log_data;

        # If the filtered log data is empty, return a default message
        return @filtered_log_data ? \@filtered_log_data : 'No log entries for this site.';
    } else {
        # If the log file does not exist, return a default message
        return 'The log file does not exist.';
    }
}
__PACKAGE__->meta->make_immutable;

1;
