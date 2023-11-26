package Comserv::Model::Schema;
use Moose;
use namespace::autoclean;

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces();

=head1 NAME

Comserv::Model::Schema - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=encoding utf8

=head1 AUTHOR

Shanta McBain

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;