use utf8;
package Comserv::Model::Schema::ShantaForager::Result::Contact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::Contact

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Contacts>

=cut

__PACKAGE__->table("Contacts");

=head1 ACCESSORS

=head2 contactid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 customerid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

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

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 mobile

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 notes

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=cut

__PACKAGE__->add_columns(
  "contactid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "customerid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "first",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "mid",
  { data_type => "char", is_nullable => 1, size => 1 },
  "last",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "phone",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "mobile",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "notes",
  { data_type => "varchar", is_nullable => 1, size => 80 },
);

=head1 PRIMARY KEY

=over 4

=item * L</contactid>

=back

=cut

__PACKAGE__->set_primary_key("contactid");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SeYiSqixy9XTkfP5p/3nXg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
