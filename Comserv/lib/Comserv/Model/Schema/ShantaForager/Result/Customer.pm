use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Customer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Customer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Customers>

=cut

__PACKAGE__->table("Customers");

=head1 ACCESSORS

=head2 customerid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 first

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 mid

  data_type: 'char'
  is_nullable: 1
  size: 1

=head2 last

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 telephone

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 fax

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 state

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 zip

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 balance

  data_type: 'float'
  is_nullable: 1
  size: [10,8]

=head2 ccnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 ccname

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 company

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 ccexpire

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 country

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 overdraft

  data_type: 'float'
  is_nullable: 1
  size: [10,8]

=cut

__PACKAGE__->add_columns(
  "customerid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "first",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "mid",
  { data_type => "char", is_nullable => 1, size => 1 },
  "last",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "address",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "telephone",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "fax",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "state",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "zip",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "balance",
  { data_type => "float", is_nullable => 1, size => [10, 8] },
  "ccnumber",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "ccname",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "ccexpire",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "country",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "overdraft",
  { data_type => "float", is_nullable => 1, size => [10, 8] },
);

=head1 PRIMARY KEY

=over 4

=item * L</customerid>

=back

=cut

__PACKAGE__->set_primary_key("customerid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lwdW5RAbJme9apsE7ykklQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
