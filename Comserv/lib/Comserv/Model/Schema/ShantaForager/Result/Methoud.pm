use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Methoud;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Methoud

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<methouds>

=cut

__PACKAGE__->table("methouds");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 file_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 60

=head2 methoud_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 area

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 catagory

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 discription

  data_type: 'text'
  is_nullable: 0

=head2 code

  data_type: 'text'
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 reporter

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 developer

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "file_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "methoud_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "area",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "catagory",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "discription",
  { data_type => "text", is_nullable => 0 },
  "code",
  { data_type => "text", is_nullable => 0 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "reporter",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "developer",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UqSzcUmia8XRb1HhHN45qA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
