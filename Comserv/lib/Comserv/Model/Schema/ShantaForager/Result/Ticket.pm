use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Ticket;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Ticket

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Tickets>

=cut

__PACKAGE__->table("Tickets");

=head1 ACCESSORS

=head2 ticketid

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

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'enum'
  extra: {list => ["Open","Closed"]}
  is_nullable: 1

=head2 opendate

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 opentime

  data_type: 'time'
  is_nullable: 1

=head2 closedate

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 closetime

  data_type: 'time'
  is_nullable: 1

=head2 opener

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 billable

  data_type: 'enum'
  extra: {list => ["Yes","No"]}
  is_nullable: 1

=head2 billed

  data_type: 'enum'
  extra: {list => ["Yes","No"]}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "ticketid",
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
  { data_type => "text", is_nullable => 1 },
  "status",
  {
    data_type => "enum",
    extra => { list => ["Open", "Closed"] },
    is_nullable => 1,
  },
  "opendate",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "opentime",
  { data_type => "time", is_nullable => 1 },
  "closedate",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "closetime",
  { data_type => "time", is_nullable => 1 },
  "opener",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "billable",
  {
    data_type => "enum",
    extra => { list => ["Yes", "No"] },
    is_nullable => 1,
  },
  "billed",
  {
    data_type => "enum",
    extra => { list => ["Yes", "No"] },
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</ticketid>

=back

=cut

__PACKAGE__->set_primary_key("ticketid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hVZ39R4CHvqLHIcKxoXN1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
