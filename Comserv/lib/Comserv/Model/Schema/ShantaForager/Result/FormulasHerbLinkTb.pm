use utf8;
package Comserv::Model::Schema::ShantaForager::Result::FormulasHerbLinkTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::FormulasHerbLinkTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<formulas_herb_link_tb>

=cut

__PACKAGE__->table("formulas_herb_link_tb");

=head1 ACCESSORS

=head2 link_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 formula_name

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 herb_name

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 user_name_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 time_date_posted

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=cut

__PACKAGE__->add_columns(
  "link_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "formula_name",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "herb_name",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "user_name_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "group_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "time_date_posted",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</link_id>

=back

=cut

__PACKAGE__->set_primary_key("link_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JsxUNWOnNfnUjqAnp66Jvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
