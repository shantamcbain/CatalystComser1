use utf8;
package Comserv::Model::Schema::ShantaForager::Result::CompanysTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::CompanysTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<companys_tb>

=cut

__PACKAGE__->table("companys_tb");

=head1 ACCESSORS

=head2 company_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 website

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 validated

  data_type: 'enum'
  default_value: 'N'
  extra: {list => ["Y","N"]}
  is_nullable: 1

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
  "company_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "website",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "validated",
  {
    data_type => "enum",
    default_value => "N",
    extra => { list => ["Y", "N"] },
    is_nullable => 1,
  },
  "user_name_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "group_of_poster",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "time_date_posted",
  { data_type => "varchar", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</company_id>

=back

=cut

__PACKAGE__->set_primary_key("company_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OW3fkhmOZ09kP5cPih9n0A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
