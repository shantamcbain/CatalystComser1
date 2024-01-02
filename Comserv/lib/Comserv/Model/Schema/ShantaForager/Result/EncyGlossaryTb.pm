use utf8;
package Comserv::Model::Schema::ShantaForager::Result::EncyGlossaryTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::EncyGlossaryTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ency_glossary_tb>

=cut

__PACKAGE__->table("ency_glossary_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 list_category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 definition

  data_type: 'text'
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 publisher_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 date_of_publication

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 isbn

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 15

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

=head2 title

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

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
  "list_category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "definition",
  { data_type => "text", is_nullable => 0 },
  "sitename",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "publisher_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_of_publication",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "isbn",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 15 },
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
  "title",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
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


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/l7e66hKd1KK4MgjXhk0sw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
