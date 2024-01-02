use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CscExpenseTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CscExpenseTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<csc_expense_tb>

=cut

__PACKAGE__->table("csc_expense_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 sitename

  data_type: 'varchar'
  default_value: 'All'
  is_nullable: 0
  size: 20

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
  "sitename",
  {
    data_type => "varchar",
    default_value => "All",
    is_nullable => 0,
    size => 20,
  },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zLANYErwO4nKIKotJarJTg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
