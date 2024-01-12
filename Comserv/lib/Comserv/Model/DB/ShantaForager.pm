package Comserv::Model::DB::ShantaForager;
use Moose;
extends 'Catalyst::Model::DBIC::Schema';

# Add a class attribute to store the DBI information
has 'dbi_info' => (
    is => 'ro',
    isa => 'HashRef',
    lazy => 1,
    default => sub {
        # Read the DBI information from the secure JSON file
        return decode_json(path('secure_dbi_info.json')->slurp_utf8);
    },
);

# Set the schema_class and connect_info when the package is loaded
__PACKAGE__->config(
    schema_class => 'Comserv::Model::Schema::ShantaForager',
    connect_info => sub {
        my $self = shift;
        my $dbi_info = $self->dbi_info->{shanta_forager};
        return {
        dsn => "dbi:mysql:database=$dbi_info->{database};host=$dbi_info->{host};port=$dbi_info->{port}",
            user => $dbi_info->{username},
            password => $dbi_info->{password},
        };
    },
);

__PACKAGE__->meta->make_immutable;
1;1;