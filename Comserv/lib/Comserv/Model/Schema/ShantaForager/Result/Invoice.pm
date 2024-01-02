use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Invoice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Invoice

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Invoices>

=cut

__PACKAGE__->table("Invoices");

=head1 ACCESSORS

=head2 invoiceid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 customerid

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 datebilled

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 amount

  data_type: 'float'
  is_nullable: 1
  size: [10,8]

=cut

__PACKAGE__->add_columns(
  "invoiceid",
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
  "description",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "datebilled",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "amount",
  { data_type => "float", is_nullable => 1, size => [10, 8] },
);

=head1 PRIMARY KEY

=over 4

=item * L</invoiceid>

=back

=cut

__PACKAGE__->set_primary_key("invoiceid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n5PkrLiV10BTU8Gzf5YJTg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
