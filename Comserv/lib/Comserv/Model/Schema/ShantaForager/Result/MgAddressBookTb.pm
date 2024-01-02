use utf8;
package Comserv::Model::Schema::ShantaForager::Result::MgAddressBookTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::MgAddressBookTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<mg_address_book_tb>

=cut

__PACKAGE__->table("mg_address_book_tb");

=head1 ACCESSORS

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 lname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 phone

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 share

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 address1

  data_type: 'text'
  is_nullable: 1

=head2 address2

  data_type: 'text'
  is_nullable: 0

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

=head2 fax

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 mobile

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 url

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 company_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 75

=head2 title

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 department

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 username_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=cut

__PACKAGE__->add_columns(
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "lname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "phone",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "share",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "address1",
  { data_type => "text", is_nullable => 1 },
  "address2",
  { data_type => "text", is_nullable => 0 },
  "city",
  { data_type => "text", is_nullable => 1 },
  "prov",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "zip",
  { data_type => "varchar", is_nullable => 1, size => 15 },
  "country",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "fax",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "mobile",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "company_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 75 },
  "title",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "department",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "username_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "group_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "date_time_posted",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TfXhN2R9i9gWsugDYXgwwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
