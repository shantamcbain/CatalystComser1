use utf8;
package Comserv::Model::Schema::ShantaForager::Result::BlockType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::BlockType

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<block_type>

=cut

__PACKAGE__->table("block_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 subtable

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 file

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 handler

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 template

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "subtable",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "file",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "handler",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "template",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Yyir2wyoKgdFm7mLKuYWNg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
