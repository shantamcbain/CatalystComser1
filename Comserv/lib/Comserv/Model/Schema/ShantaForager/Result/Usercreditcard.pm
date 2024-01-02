use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Usercreditcard;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Usercreditcard

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<usercreditcard>

=cut

__PACKAGE__->table("usercreditcard");

=head1 ACCESSORS

=head2 ccid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 userid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 ccpassword

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 ccname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 cccompany

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 ccaddress

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 cccity

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 ccstate

  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 cczip

  data_type: 'varchar'
  is_nullable: 1
  size: 12

=head2 cccountry

  data_type: 'char'
  is_nullable: 1
  size: 3

=head2 ccnumber

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 ccexpires

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 6

=head2 ccbinnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 cccicnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 ccbusinesstype

  data_type: 'char'
  is_nullable: 1
  size: 1

=cut

__PACKAGE__->add_columns(
  "ccid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "userid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "ccpassword",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "ccname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "cccompany",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "ccaddress",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "cccity",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "ccstate",
  { data_type => "varchar", is_nullable => 1, size => 4 },
  "cczip",
  { data_type => "varchar", is_nullable => 1, size => 12 },
  "cccountry",
  { data_type => "char", is_nullable => 1, size => 3 },
  "ccnumber",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "ccexpires",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 6 },
  "ccbinnumber",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "cccicnumber",
  { data_type => "varchar", is_nullable => 1, size => 4 },
  "ccbusinesstype",
  { data_type => "char", is_nullable => 1, size => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ccid>

=back

=cut

__PACKAGE__->set_primary_key("ccid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SohBXRNtw8cxOWwoqrBIqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
