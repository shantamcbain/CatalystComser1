use utf8;
package Comserv::Model::Schema::ShantaForager::Result::HerbAstringentLinkTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::HerbAstringentLinkTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Herb_Astringent_Link_tb>

=cut

__PACKAGE__->table("Herb_Astringent_Link_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 action_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 herb_code

  data_type: 'varchar'
  default_value: (empty string)
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
  "action_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "herb_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
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


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KHE55ARtgQkA0G4T5o2vTg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
