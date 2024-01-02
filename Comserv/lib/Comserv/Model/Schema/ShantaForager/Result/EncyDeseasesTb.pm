use utf8;
package Comserv::Model::Schema::ShantaForager::Result::EncyDeseasesTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::EncyDeseasesTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ency_deseases_tb>

=cut

__PACKAGE__->table("ency_deseases_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 desease_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 display_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 medical_uses

  data_type: 'text'
  is_nullable: 0

=head2 herbs

  data_type: 'text'
  is_nullable: 0

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 contra_indications

  data_type: 'text'
  is_nullable: 0

=head2 preparation

  data_type: 'text'
  is_nullable: 0

=head2 dosage

  data_type: 'text'
  is_nullable: 0

=head2 administration

  data_type: 'text'
  is_nullable: 0

=head2 history

  data_type: 'text'
  is_nullable: 0

=head2 reference

  data_type: 'text'
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 200

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 visibility

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 active

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 0

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
  "desease_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "display_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "medical_uses",
  { data_type => "text", is_nullable => 0 },
  "herbs",
  { data_type => "text", is_nullable => 0 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "contra_indications",
  { data_type => "text", is_nullable => 0 },
  "preparation",
  { data_type => "text", is_nullable => 0 },
  "dosage",
  { data_type => "text", is_nullable => 0 },
  "administration",
  { data_type => "text", is_nullable => 0 },
  "history",
  { data_type => "text", is_nullable => 0 },
  "reference",
  { data_type => "text", is_nullable => 0 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 200 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "visibility",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "active",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 0 },
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

=head1 UNIQUE CONSTRAINTS

=head2 C<formula_code>

=over 4

=item * L</desease_code>

=back

=cut

__PACKAGE__->add_unique_constraint("formula_code", ["desease_code"]);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ex0+LRV1mwnXiraH/HqTYA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
