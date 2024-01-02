use utf8;
package Comserv::Model::Schema::ShantaForager::Result::UserTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::UserTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_tb>

=cut

__PACKAGE__->table("user_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 primary_comp_code

  data_type: 'varchar'
  default_value: 'CSC'
  is_nullable: 0
  size: 30

=head2 email_adress

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 birthdate

  data_type: 'date'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00'
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: 'Pending'
  is_nullable: 0
  size: 30

=head2 comment

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

=head2 time_date_of_post

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "first_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "last_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "primary_comp_code",
  {
    data_type => "varchar",
    default_value => "CSC",
    is_nullable => 0,
    size => 30,
  },
  "email_adress",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "birthdate",
  {
    data_type => "date",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00",
    is_nullable => 0,
  },
  "status",
  {
    data_type => "varchar",
    default_value => "Pending",
    is_nullable => 0,
    size => 30,
  },
  "comment",
  { data_type => "text", is_nullable => 0 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "time_date_of_post",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1GwR/oJoN6xuC1azwPfexQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
