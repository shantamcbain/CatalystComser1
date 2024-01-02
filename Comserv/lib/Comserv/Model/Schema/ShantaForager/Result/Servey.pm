use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Servey;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Servey

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<servey>

=cut

__PACKAGE__->table("servey");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 gender

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

=head2 favorite_band_leaders

  data_type: 'text'
  is_nullable: 0

=head2 favorite_modern_group

  data_type: 'text'
  is_nullable: 0

=head2 own_two_tones

  data_type: 'text'
  is_nullable: 0

=head2 number_of_swing_albums_owned

  data_type: 'smallint'
  default_value: 0
  is_nullable: 0

=head2 styles_known

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

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

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "gender",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
  "favorite_band_leaders",
  { data_type => "text", is_nullable => 0 },
  "favorite_modern_group",
  { data_type => "text", is_nullable => 0 },
  "own_two_tones",
  { data_type => "text", is_nullable => 0 },
  "number_of_swing_albums_owned",
  { data_type => "smallint", default_value => 0, is_nullable => 0 },
  "styles_known",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a92YTKeLOFTEoADqc2jxqw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
