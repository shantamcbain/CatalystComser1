use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CspsOppsSurveyTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CspsOppsSurveyTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<csps_opps_survey_tb>

=cut

__PACKAGE__->table("csps_opps_survey_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 company_id

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 project_code

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

=head2 developer_name

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
  "company_id",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "project_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "project_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "project_size",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "estimated_man_hours",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "developer_name",
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

=item * L</project_code>

=back

=cut

__PACKAGE__->set_primary_key("record_id", "project_code");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2fYNCeYtjbOpp64QyxuFhA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
