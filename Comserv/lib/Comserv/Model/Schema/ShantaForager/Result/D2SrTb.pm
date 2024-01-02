use utf8;
package Comserv::Model::Schema::ShantaForager::Result::D2SrTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::D2SrTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<d2_sr_tb>

=cut

__PACKAGE__->table("d2_sr_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 reporter

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 company_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 project_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 lname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 question

  data_type: 'text'
  is_nullable: 0

=head2 details

  data_type: 'text'
  is_nullable: 0

=head2 developer

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 priority

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 60

=head2 sr_description

  data_type: 'text'
  is_nullable: 0

=head2 sever_os

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 comments

  data_type: 'text'
  is_nullable: 1

=head2 error_code

  data_type: 'text'
  is_nullable: 0

=head2 estimated_man_hours

  data_type: 'float'
  default_value: 0
  is_nullable: 0

=head2 accumulative_time

  data_type: 'float'
  default_value: 0
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
  "reporter",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "company_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "project_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "lname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "question",
  { data_type => "text", is_nullable => 0 },
  "details",
  { data_type => "text", is_nullable => 0 },
  "developer",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "priority",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "sr_description",
  { data_type => "text", is_nullable => 0 },
  "sever_os",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "error_code",
  { data_type => "text", is_nullable => 0 },
  "estimated_man_hours",
  { data_type => "float", default_value => 0, is_nullable => 0 },
  "accumulative_time",
  { data_type => "float", default_value => 0, is_nullable => 0 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kV7z0iH5nBntzpsQBisIYg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
