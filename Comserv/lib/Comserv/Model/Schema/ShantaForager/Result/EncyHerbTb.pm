use utf8;
package Comserv::Model::Schema::ShantaForager::Result::EncyHerbTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::EncyHerbTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ency_herb_tb>

=cut

__PACKAGE__->table("ency_herb_tb");

=head1 ACCESSORS

=head2 therapeutic_action

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 250

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 botanical_name

  data_type: 'text'
  is_nullable: 0

=head2 common_names

  data_type: 'text'
  is_nullable: 0

=head2 key_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 parts_used

  data_type: 'text'
  is_nullable: 1

=head2 share

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 medical_uses

  data_type: 'text'
  is_nullable: 1

=head2 ident_character

  data_type: 'text'
  is_nullable: 0

=head2 image

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 200

=head2 stem

  data_type: 'text'
  is_nullable: 1

=head2 leaves

  data_type: 'text'
  is_nullable: 1

=head2 flowers

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 fruit

  data_type: 'text'
  is_nullable: 1

=head2 taste

  data_type: 'text'
  is_nullable: 1

=head2 odour

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 distribution

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 body_parts

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 175

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 constituents

  data_type: 'text'
  is_nullable: 0

=head2 solvents

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 root

  data_type: 'text'
  is_nullable: 0

=head2 chinese

  data_type: 'text'
  is_nullable: 0

=head2 homiopathic

  data_type: 'text'
  is_nullable: 0

=head2 contra_indications

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 preparation

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 dosage

  data_type: 'text'
  is_nullable: 0

=head2 administration

  data_type: 'text'
  is_nullable: 0

=head2 formulas

  data_type: 'text'
  is_nullable: 0

=head2 vetrinary

  data_type: 'text'
  is_nullable: 0

=head2 culinary

  data_type: 'varchar'
  is_nullable: 0
  size: 500

=head2 cultivation

  data_type: 'text'
  is_nullable: 0

=head2 pollinator

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 apis

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 nectar

  data_type: 'integer'
  is_nullable: 0

=head2 nectarnotes

  data_type: 'text'
  is_nullable: 0

=head2 pollen

  data_type: 'integer'
  is_nullable: 0

=head2 pollennotes

  data_type: 'text'
  is_nullable: 0

=head2 sister_plants

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 harvest

  data_type: 'text'
  is_nullable: 0

=head2 non_med

  data_type: 'text'
  is_nullable: 0

=head2 history

  data_type: 'text'
  is_nullable: 0

=head2 reference

  data_type: 'text'
  is_nullable: 0

=head2 username_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=cut

__PACKAGE__->add_columns(
  "therapeutic_action",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "botanical_name",
  { data_type => "text", is_nullable => 0 },
  "common_names",
  { data_type => "text", is_nullable => 0 },
  "key_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "parts_used",
  { data_type => "text", is_nullable => 1 },
  "share",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "medical_uses",
  { data_type => "text", is_nullable => 1 },
  "ident_character",
  { data_type => "text", is_nullable => 0 },
  "image",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 200 },
  "stem",
  { data_type => "text", is_nullable => 1 },
  "leaves",
  { data_type => "text", is_nullable => 1 },
  "flowers",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "fruit",
  { data_type => "text", is_nullable => 1 },
  "taste",
  { data_type => "text", is_nullable => 1 },
  "odour",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "distribution",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "body_parts",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 175 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "constituents",
  { data_type => "text", is_nullable => 0 },
  "solvents",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "root",
  { data_type => "text", is_nullable => 0 },
  "chinese",
  { data_type => "text", is_nullable => 0 },
  "homiopathic",
  { data_type => "text", is_nullable => 0 },
  "contra_indications",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "preparation",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "dosage",
  { data_type => "text", is_nullable => 0 },
  "administration",
  { data_type => "text", is_nullable => 0 },
  "formulas",
  { data_type => "text", is_nullable => 0 },
  "vetrinary",
  { data_type => "text", is_nullable => 0 },
  "culinary",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "cultivation",
  { data_type => "text", is_nullable => 0 },
  "pollinator",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "apis",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "nectar",
  { data_type => "integer", is_nullable => 0 },
  "nectarnotes",
  { data_type => "text", is_nullable => 0 },
  "pollen",
  { data_type => "integer", is_nullable => 0 },
  "pollennotes",
  { data_type => "text", is_nullable => 0 },
  "sister_plants",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "harvest",
  { data_type => "text", is_nullable => 0 },
  "non_med",
  { data_type => "text", is_nullable => 0 },
  "history",
  { data_type => "text", is_nullable => 0 },
  "reference",
  { data_type => "text", is_nullable => 0 },
  "username_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "group_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "date_time_posted",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4WAPgPbkxObeB07XCvyTMw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
