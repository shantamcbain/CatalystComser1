use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CscAlbumTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CscAlbumTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<csc_album_tb>

=cut

__PACKAGE__->table("csc_album_tb");

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

=head2 artist

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 album_title

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 price

  data_type: 'float'
  default_value: 0
  is_nullable: 0

=head2 distributor

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 quantity

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=head2 length

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 120

=head2 format

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 category

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
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "artist",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "album_title",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "price",
  { data_type => "float", default_value => 0, is_nullable => 0 },
  "distributor",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "quantity",
  { data_type => "smallint", default_value => 1, is_nullable => 0 },
  "length",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 120 },
  "format",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AJj2dWDmwrS8MLmSoo0SxA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
