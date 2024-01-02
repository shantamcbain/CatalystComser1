use utf8;
package Comserv::Model::Schema::ShantaForager::Result::EncyKbTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::EncyKbTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ency_kb_tb>

=cut

__PACKAGE__->table("ency_kb_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: 'Draft'
  is_nullable: 0
  size: 20

=head2 kb_type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 questions

  data_type: 'text'
  is_nullable: 0

=head2 summary

  data_type: 'text'
  is_nullable: 1

=head2 workaround

  data_type: 'text'
  is_nullable: 1

=head2 solution

  data_type: 'text'
  is_nullable: 1

=head2 user_type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 category_1

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 category_2

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 audience

  data_type: 'varchar'
  default_value: 'Internal'
  is_nullable: 0
  size: 20

=head2 submitted_by

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 internal_notes

  data_type: 'text'
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 count

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 owner

  data_type: 'varchar'
  default_value: 'WebCT'
  is_nullable: 0
  size: 30

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "status",
  {
    data_type => "varchar",
    default_value => "Draft",
    is_nullable => 0,
    size => 20,
  },
  "kb_type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "questions",
  { data_type => "text", is_nullable => 0 },
  "summary",
  { data_type => "text", is_nullable => 1 },
  "workaround",
  { data_type => "text", is_nullable => 1 },
  "solution",
  { data_type => "text", is_nullable => 1 },
  "user_type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "category_1",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "category_2",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "audience",
  {
    data_type => "varchar",
    default_value => "Internal",
    is_nullable => 0,
    size => 20,
  },
  "submitted_by",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "internal_notes",
  { data_type => "text", is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "count",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "owner",
  {
    data_type => "varchar",
    default_value => "WebCT",
    is_nullable => 0,
    size => 30,
  },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2ULUtOSwR2hijSKBwZedvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
