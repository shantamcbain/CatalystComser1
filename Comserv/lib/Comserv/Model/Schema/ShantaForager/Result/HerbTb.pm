use utf8;
package Comserv::Model::Schema::ShantaForager::Result::HerbTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::HerbTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<herb_tb>

=cut

__PACKAGE__->table("herb_tb");

=head1 ACCESSORS

=head2 herb_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 botanical_name

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 common_names

  data_type: 'text'
  is_nullable: 1

=head2 pharmacopeial_names

  data_type: 'text'
  is_nullable: 1

=head2 distribution

  data_type: 'text'
  is_nullable: 1

=head2 parts_used

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 body_parts_affected

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 constituents

  data_type: 'text'
  is_nullable: 1

=head2 solvents

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 astrological

  data_type: 'text'
  is_nullable: 1

=head2 numberlogical

  data_type: 'text'
  is_nullable: 1

=head2 medical_uses

  data_type: 'text'
  is_nullable: 1

=head2 homeopathic

  data_type: 'text'
  is_nullable: 1

=head2 chjnese

  data_type: 'text'
  is_nullable: 1

=head2 contra_indications

  data_type: 'text'
  is_nullable: 1

=head2 preperation

  data_type: 'text'
  is_nullable: 1

=head2 dosage

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 administrations

  data_type: 'text'
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 1

=head2 congenial_comb

  data_type: 'text'
  is_nullable: 1

=head2 non_medical_uses

  data_type: 'text'
  is_nullable: 1

=head2 cultivation

  data_type: 'text'
  is_nullable: 1

=head2 sister_plants

  data_type: 'text'
  is_nullable: 1

=head2 nectar

  data_type: 'integer'
  is_nullable: 0

=head2 history

  data_type: 'text'
  is_nullable: 1

=head2 harvest

  data_type: 'text'
  is_nullable: 1

=head2 reference

  data_type: 'text'
  is_nullable: 1

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
  "herb_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "botanical_name",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "common_names",
  { data_type => "text", is_nullable => 1 },
  "pharmacopeial_names",
  { data_type => "text", is_nullable => 1 },
  "distribution",
  { data_type => "text", is_nullable => 1 },
  "parts_used",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "body_parts_affected",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "constituents",
  { data_type => "text", is_nullable => 1 },
  "solvents",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "astrological",
  { data_type => "text", is_nullable => 1 },
  "numberlogical",
  { data_type => "text", is_nullable => 1 },
  "medical_uses",
  { data_type => "text", is_nullable => 1 },
  "homeopathic",
  { data_type => "text", is_nullable => 1 },
  "chjnese",
  { data_type => "text", is_nullable => 1 },
  "contra_indications",
  { data_type => "text", is_nullable => 1 },
  "preperation",
  { data_type => "text", is_nullable => 1 },
  "dosage",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "administrations",
  { data_type => "text", is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "congenial_comb",
  { data_type => "text", is_nullable => 1 },
  "non_medical_uses",
  { data_type => "text", is_nullable => 1 },
  "cultivation",
  { data_type => "text", is_nullable => 1 },
  "sister_plants",
  { data_type => "text", is_nullable => 1 },
  "nectar",
  { data_type => "integer", is_nullable => 0 },
  "history",
  { data_type => "text", is_nullable => 1 },
  "harvest",
  { data_type => "text", is_nullable => 1 },
  "reference",
  { data_type => "text", is_nullable => 1 },
  "user_name_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "group_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "time_date_posted",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</herb_id>

=back

=cut

__PACKAGE__->set_primary_key("herb_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OowSd1h2C+bD6lLxZJs0zQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
