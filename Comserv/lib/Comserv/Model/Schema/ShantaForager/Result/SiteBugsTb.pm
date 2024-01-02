use utf8;
package Comserv::Model::Schema::ShantaForager::Result::SiteBugsTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::SiteBugsTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<site_bugs_tb>

=cut

__PACKAGE__->table("site_bugs_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 bug_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 bug_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 bug_description

  data_type: 'text'
  is_nullable: 0

=head2 task_code

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 task_name

  data_type: 'varchar'
  is_nullable: 1
  size: 75

=head2 rep_description

  data_type: 'text'
  is_nullable: 1

=head2 priority

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 version

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 build

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 browser

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 os

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 accumulative_time

  data_type: 'integer'
  is_nullable: 1

=head2 developer_name

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 client_name

  data_type: 'varchar'
  is_nullable: 1
  size: 30

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

=head2 abstract

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "status",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "bug_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "bug_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "bug_description",
  { data_type => "text", is_nullable => 0 },
  "task_code",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "task_name",
  { data_type => "varchar", is_nullable => 1, size => 75 },
  "rep_description",
  { data_type => "text", is_nullable => 1 },
  "priority",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "version",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "build",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "browser",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "os",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "accumulative_time",
  { data_type => "integer", is_nullable => 1 },
  "developer_name",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "client_name",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "abstract",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:To9e6QzPqfHbZ9Wibj2dUg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
