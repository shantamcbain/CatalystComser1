use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Jb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Jb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<JB>

=cut

__PACKAGE__->table("JB");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 lname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 fname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 resume

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 tnv

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq9

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq10

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq11

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq12

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq13

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq14

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq15

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq16

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq17

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq18

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq19

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq20

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq21

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq22

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq23

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq24

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq25

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq26

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq27

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq28

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq29

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq30

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq31

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 inq32

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 phone

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 resume_filename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "lname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "fname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "resume",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "tnv",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq9",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq10",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq11",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq12",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq13",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq14",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq15",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq16",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq17",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq18",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq19",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq20",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq21",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq22",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq23",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq24",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq25",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq26",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq27",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq28",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq29",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq30",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq31",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "inq32",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "phone",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "resume_filename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n2RQBm4bgw9mGcWBxYqhXw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
