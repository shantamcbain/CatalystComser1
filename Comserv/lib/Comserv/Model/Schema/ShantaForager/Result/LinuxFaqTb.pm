use utf8;
package Comserv::Model::Schema::ShantaForager::Result::LinuxFaqTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::LinuxFaqTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<linux_faq_tb>

=cut

__PACKAGE__->table("linux_faq_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'tinyint'
  is_auto_increment: 1
  is_nullable: 0

=head2 owner

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 150

=head2 question

  data_type: 'text'
  is_nullable: 0

=head2 answer

  data_type: 'text'
  is_nullable: 0

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "tinyint", is_auto_increment => 1, is_nullable => 0 },
  "owner",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 150 },
  "question",
  { data_type => "text", is_nullable => 0 },
  "answer",
  { data_type => "text", is_nullable => 0 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<record_id>

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->add_unique_constraint("record_id", ["record_id"]);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dhGb9rwzMWQVZl95WXm2rg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
