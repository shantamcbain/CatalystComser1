use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Payment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Payment

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Payments>

=cut

__PACKAGE__->table("Payments");

=head1 ACCESSORS

=head2 paymentid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 customerid

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 datepaid

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 number

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 amount

  data_type: 'float'
  is_nullable: 1
  size: [10,8]

=cut

__PACKAGE__->add_columns(
  "paymentid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "customerid",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "datepaid",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "type",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "number",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "amount",
  { data_type => "float", is_nullable => 1, size => [10, 8] },
);

=head1 PRIMARY KEY

=over 4

=item * L</paymentid>

=back

=cut

__PACKAGE__->set_primary_key("paymentid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5krU6rNDM1M71S7XcHdqnA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
