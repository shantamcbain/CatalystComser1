use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Document;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Document

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<document>

=cut

__PACKAGE__->table("document");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 document

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 created

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 updated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 1

=head2 title

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 category

  data_type: 'integer'
  is_nullable: 1

=head2 category_position

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 member_level

  data_type: 'integer'
  is_nullable: 1

=head2 subtext

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 doc_type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 bodytext

  data_type: 'text'
  is_nullable: 0

=head2 member

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 reads

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 responses

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 last_activity

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 1

=head2 revision

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "document",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "created",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 1,
  },
  "title",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "category",
  { data_type => "integer", is_nullable => 1 },
  "category_position",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "member_level",
  { data_type => "integer", is_nullable => 1 },
  "subtext",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "doc_type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "bodytext",
  { data_type => "text", is_nullable => 0 },
  "member",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "reads",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "responses",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "last_activity",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 1,
  },
  "revision",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4RL9yHVBmHiNPk2S9+vJvg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
