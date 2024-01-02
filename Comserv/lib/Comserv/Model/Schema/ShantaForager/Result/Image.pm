use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Image;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Image

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<image>

=cut

__PACKAGE__->table("image");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 file

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 height

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 width

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 heightwidth

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 align

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 show_thumbnail

  data_type: 'varchar'
  default_value: 'default'
  is_nullable: 0
  size: 10

=head2 alt

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 content_type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 data

  data_type: 'longblob'
  is_nullable: 0

=head2 thumb_height

  data_type: 'integer'
  default_value: 64
  is_nullable: 0

=head2 thumb_width

  data_type: 'integer'
  default_value: 64
  is_nullable: 0

=head2 thumbnail

  data_type: 'longblob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "file",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "height",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "width",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "heightwidth",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "align",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "show_thumbnail",
  {
    data_type => "varchar",
    default_value => "default",
    is_nullable => 0,
    size => 10,
  },
  "alt",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "content_type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "data",
  { data_type => "longblob", is_nullable => 0 },
  "thumb_height",
  { data_type => "integer", default_value => 64, is_nullable => 0 },
  "thumb_width",
  { data_type => "integer", default_value => 64, is_nullable => 0 },
  "thumbnail",
  { data_type => "longblob", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:i7/+7JXG3KmZ47zDZEZa9Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
