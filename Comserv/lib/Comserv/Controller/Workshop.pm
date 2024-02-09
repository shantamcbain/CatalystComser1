package Comserv::Controller::Workshop;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }


sub workshops :Path('/workshops')  :Args(0) {
    my ( $self, $c ) = @_;
    print "In workshops\n";
    my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });
    my $file = "/Data/workshops.csv";

    if (-e $file and -r _) {
        print "File exists and is readable\n";
        open my $fh, "<:encoding(utf8)", $file or die "$file: $!";
        my @rows = @{$csv->getline_all($fh)};
        close $fh;

        $c->stash(workshops => \@rows);
        $c->stash(template => 'WorkShops/workshops.tt');

    } else {
        print "File does not exist or is not readable\n";
        $c->stash(error_message => "There are no workshops available.");
        $c->stash(template => 'WorkShops/workshops.tt');
    }
           $c->forward($c->view('TT'));
}
sub add :Path('/workshops/add') :Args(0) {
    my ( $self, $c ) = @_;

    if ($c->request->method eq 'POST') {
        # Handle form submission
        # Get the form data from the request
        my $workshop_data = $c->request->body_parameters;

        # Open the CSV file in append mode
        my $file = "/Data/workshops.csv";
        open my $fh, ">>:encoding(utf8)", $file or die "$file: $!";

        # Create a new Text::CSV object
        my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });

        # Write the form data to the CSV file
        $csv->print($fh, [values %$workshop_data]);

        # Close the CSV file
        close $fh;

        # Redirect to the workshops list
        $c->response->redirect($c->uri_for($self->action_for('workshops')));
    } else {
        # Display the form
        $c->stash(template => 'WorkShops/addworkshop.tt');
    }
    $c->forward($c->view('TT'));
}
sub delete :Path('/workshops/delete') :Args(1) {
    my ( $self, $c, $id_to_delete ) = @_;

    # Open the file in read mode
    open my $fh, '<', 'workshops.tt' or die "Cannot open workshops.tt: $!";

    # Read the entire file into memory
    my @lines = <$fh>;

    # Close the file
    close $fh;

    # Open the file in write mode (this will erase the file)
    open $fh, '>', 'workshops.tt' or die "Cannot open workshops.tt: $!";

    # Write back only the records that don't match the ID to delete
    my $skip = 0;
    foreach my $line (@lines) {
        if ($line =~ /ID => (\d+)/) {
            $skip = ($1 == $id_to_delete) ? 1 : 0;
        }
        print $fh $line unless $skip;
        $skip = 0 if $line =~ /---/;
    }

    # Close the file
    close $fh;
}
__PACKAGE__->meta->make_immutable;

1;
