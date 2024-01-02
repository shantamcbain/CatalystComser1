use utf8;
package Comserv::Model::Schema::ShantaForager::Result::FamilyEvent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::FamilyEvent

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<family_event>

=cut

__PACKAGE__->table("family_event");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 famid

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 20

=head2 family_event_type

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 date_str

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 note

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "famid",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 20 },
  "family_event_type",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "date_str",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "note",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:D+rSr4j1BQduGPgnmsv2EQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
