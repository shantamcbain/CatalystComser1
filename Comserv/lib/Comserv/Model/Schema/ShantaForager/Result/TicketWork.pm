use utf8;
package Comserv::Model::Schema::ShantaForager::Result::TicketWork;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::TicketWork

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<TicketWork>

=cut

__PACKAGE__->table("TicketWork");

=head1 ACCESSORS

=head2 ticketworkid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ticketid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "ticketworkid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ticketid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ticketworkid>

=back

=cut

__PACKAGE__->set_primary_key("ticketworkid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TkL+VYNmKSNkZV6WPqvaJA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
