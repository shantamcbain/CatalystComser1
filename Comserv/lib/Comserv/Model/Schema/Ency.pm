package Comserv::Model::Schema::Ency;
use Moose;
extends 'DBIx::Class::Schema';  # Change this line

# Use the dbi_info attribute from the Comserv::Model::DB module
my $dbi_info = Comserv::Model::DB->new->dbi_info->{ency};

# Convert the dbi_info into a format that connect_info can use
my $connect_info = {
    dsn => "dbi:mysql:database=$dbi_info->{database};host=$dbi_info->{host};port=$dbi_info->{port}",
    user => $dbi_info->{username},
    password => $dbi_info->{password},
};

# Define your result sources (tables) here
__PACKAGE__->load_namespaces();

__PACKAGE__->meta->make_immutable;
1;