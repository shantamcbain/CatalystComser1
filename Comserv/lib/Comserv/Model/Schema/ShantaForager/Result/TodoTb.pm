use utf8;
package Comserv::Model::Schema::ShantaForager::Result::TodoTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::TodoTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<todo_tb>

=cut

__PACKAGE__->table("todo_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  default_value: 'All'
  is_nullable: 0
  size: 20

=head2 owner

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 project_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 todo_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 task_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 task_description

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 priority

  data_type: 'tinyint'
  default_value: 3
  is_nullable: 0

=head2 estimated_man_hours

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 accumulative_time

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 developer_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 start_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 due_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00'
  is_nullable: 0

=head2 completion_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00'
  is_nullable: 0

=head2 client_name

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 abstract

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 spare3

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 details

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 comments

  data_type: 'text'
  is_nullable: 1

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 last_mod_by

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 last_mod_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

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
  {
    data_type => "varchar",
    default_value => "All",
    is_nullable => 0,
    size => 20,
  },
  "owner",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "project_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "todo_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "task_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "task_description",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "priority",
  { data_type => "tinyint", default_value => 3, is_nullable => 0 },
  "estimated_man_hours",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "accumulative_time",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "developer_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "start_date",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 0 },
  "due_date",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00",
    is_nullable => 0,
  },
  "completion_date",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00",
    is_nullable => 0,
  },
  "client_name",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "abstract",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "spare3",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "details",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "last_mod_by",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "last_mod_date",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 0 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bkytXjqE9oOoxU8uGaoFrA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
