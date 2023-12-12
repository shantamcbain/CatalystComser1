package Comserv::Model::Schema::Ency;
use base qw/DBIx::Class::Schema/;

__PACKAGE__->load_namespaces(
    result_namespace => 'Result',
    resultset_namespace => 'ResultSet',

);

1;