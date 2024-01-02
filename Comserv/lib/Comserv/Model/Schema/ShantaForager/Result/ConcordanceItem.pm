use utf8;
package Comserv::Model::Schema::ShantaForager::Result::ConcordanceItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::ConcordanceItem

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<concordance_item>

=cut

__PACKAGE__->table("concordance_item");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 link

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 section

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 table_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 table_key

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 summary

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "link",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "section",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "table_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "table_key",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "summary",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3Erah08/oGFynJ5HZWJhRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
