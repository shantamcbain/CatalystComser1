package Comserv::Model::DB::ShantaForager;
use Moose;
use Path::Tiny 'path';
use JSON::MaybeXS qw(decode_json);
extends 'DBIx::Class::Schema';  # Change this line

# Load the DBI information from the JSON file
my $dbi_info = decode_json(path('dbi_info.json')->slurp_utf8);

# Set the schema_class and connect_info when the package is loaded
__PACKAGE__->connection(
    "dbi:mysql:database=$dbi_info->{shanta_forager}{database};host=$dbi_info->{shanta_forager}{host};port=$dbi_info->{shanta_forager}{port}",
    $dbi_info->{shanta_forager}{username},
    $dbi_info->{shanta_forager}{password},
);

# Load namespaces
__PACKAGE__->load_namespaces();

__PACKAGE__->meta->make_immutable;
1;