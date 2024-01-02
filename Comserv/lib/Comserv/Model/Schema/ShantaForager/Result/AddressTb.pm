use utf8;
package Comserv::Model::Schema::ShantaForager::Result::AddressTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::AddressTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<address_tb>

=cut

__PACKAGE__->table("address_tb");

=head1 ACCESSORS

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 address1

  data_type: 'text'
  is_nullable: 1

=head2 city

  data_type: 'text'
  is_nullable: 1

=head2 prov

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 zip

  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 country

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 user_name_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 time_date_posted

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=cut

__PACKAGE__->add_columns(
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "address1",
  { data_type => "text", is_nullable => 1 },
  "city",
  { data_type => "text", is_nullable => 1 },
  "prov",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "zip",
  { data_type => "varchar", is_nullable => 1, size => 15 },
  "country",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "user_name_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "group_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "time_date_posted",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BrnG0ce/olBWRbkGm4DFvg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
