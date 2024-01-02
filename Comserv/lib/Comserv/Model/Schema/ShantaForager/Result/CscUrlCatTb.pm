use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CscUrlCatTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CscUrlCatTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<csc_url_cat_tb>

=cut

__PACKAGE__->table("csc_url_cat_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 project_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 project_size

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 estimated_man_hours

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 display_value

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 client_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 due_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00'
  is_nullable: 0

=head2 accumulated_time

  data_type: 'float'
  default_value: 0
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 1

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
  "sitename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "project_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "project_size",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "estimated_man_hours",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "display_value",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "client_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "due_date",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00",
    is_nullable => 0,
  },
  "accumulated_time",
  { data_type => "float", default_value => 0, is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 1 },
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

=item * L</category>

=back

=cut

__PACKAGE__->set_primary_key("record_id", "category");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JNcdWaThS8h2kgq3zA5RkA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
