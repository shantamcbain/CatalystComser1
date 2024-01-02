use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Usercheckdata;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Usercheckdata

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<usercheckdata>

=cut

__PACKAGE__->table("usercheckdata");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 userid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 checknumber

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 checkmicrnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 checkbrnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 checkbusinesstype

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 driverlicensenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 driverlicensestate

  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 useridnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 useridtype

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 useridstate

  data_type: 'char'
  is_nullable: 1
  size: 2

=head2 useridcountry

  data_type: 'char'
  is_nullable: 1
  size: 3

=head2 useridexpires

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 bankabacode

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 bankacctnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 bankaccttype

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 timestamp

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "userid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "checknumber",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "checkmicrnumber",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "checkbrnumber",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "checkbusinesstype",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "driverlicensenumber",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "driverlicensestate",
  { data_type => "varchar", is_nullable => 1, size => 4 },
  "useridnumber",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "useridtype",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "useridstate",
  { data_type => "char", is_nullable => 1, size => 2 },
  "useridcountry",
  { data_type => "char", is_nullable => 1, size => 3 },
  "useridexpires",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "bankabacode",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "bankacctnumber",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "bankaccttype",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "timestamp",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hykl+rulAmg6WBB3wxBLSQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
