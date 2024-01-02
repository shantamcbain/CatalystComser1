use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Source;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Source

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Sources>

=cut

__PACKAGE__->table("Sources");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 sourid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 auth

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 titl

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 publ

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 source

  data_type: 'blob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "sourid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "auth",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "titl",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "publ",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "source",
  { data_type => "blob", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TbkPbr8cWyUdqantRNj4PA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
