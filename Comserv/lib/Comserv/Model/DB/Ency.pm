package Comserv::Model::DB::Ency;
use Moose;
extends 'Catalyst::Model::DBIC::Schema';

# Use the dbi_info attribute from the Comserv::Model::DB module
my $dbi_info = Comserv::Model::DB->new->dbi_info->{ency};

# Convert the dbi_info into a format that connect_info can use
my $connect_info = {
    dsn => "dbi:mysql:database=$dbi_info->{database};host=$dbi_info->{host};port=$dbi_info->{port}",
    user => $dbi_info->{username},
    password => $dbi_info->{password},
};

__PACKAGE__->config(
    schema_class => 'Comserv::Model::Schema::Ency',
    connect_info => $connect_info
);

__PACKAGE__->meta->make_immutable;
1;