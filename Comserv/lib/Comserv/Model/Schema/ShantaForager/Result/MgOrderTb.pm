use utf8;
package Comserv::Model::Schema::ShantaForager::Result::MgOrderTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::MgOrderTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<mg_order_tb>

=cut

__PACKAGE__->table("mg_order_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 lname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 account_number

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 sst_number

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 35

=head2 phone

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 12

=head2 fax

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 12

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 address

  data_type: 'text'
  is_nullable: 0

=head2 city

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 prov

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 pcode

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 15

=head2 country

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 due_date

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 quantity

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 expense_type

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 60

=head2 amount_in_sing_dollar

  data_type: 'decimal'
  default_value: 0
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 project_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 approved

  data_type: 'varchar'
  default_value: 'Pend'
  is_nullable: 0
  size: 4

=head2 comments

  data_type: 'text'
  is_nullable: 1

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "lname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "account_number",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "sst_number",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 35 },
  "phone",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 12 },
  "fax",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 12 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "address",
  { data_type => "text", is_nullable => 0 },
  "city",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "prov",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "pcode",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 15 },
  "country",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "due_date",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "quantity",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "expense_type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "amount_in_sing_dollar",
  { data_type => "decimal", default_value => 0, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "project_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "approved",
  {
    data_type => "varchar",
    default_value => "Pend",
    is_nullable => 0,
    size => 4,
  },
  "comments",
  { data_type => "text", is_nullable => 1 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oNTOeVsYSZ8sdfoeMg/VHg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
