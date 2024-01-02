use utf8;
package Comserv::Model::Schema::ShantaForager::Result::LinkbatQuestionsTb;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Comserv::Model::Schema::ShantaForager::Result::LinkbatQuestionsTb

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<linkbat_questions_tb>

=cut

__PACKAGE__->table("linkbat_questions_tb");

=head1 ACCESSORS

=head2 record_id

  data_type: 'tinyint'
  is_auto_increment: 1
  is_nullable: 0

=head2 page_id

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 question

  data_type: 'text'
  is_nullable: 0

=head2 answer

  data_type: 'text'
  is_nullable: 0

=head2 w_1

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 w_2

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 w_3

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 w_4

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 100

=head2 username_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 30

=head2 group_of_poster

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 20

=head2 date_time_posted

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "record_id",
  { data_type => "tinyint", is_auto_increment => 1, is_nullable => 0 },
  "page_id",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "question",
  { data_type => "text", is_nullable => 0 },
  "answer",
  { data_type => "text", is_nullable => 0 },
  "w_1",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "w_2",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "w_3",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "w_4",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 100 },
  "username_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 30 },
  "group_of_poster",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 20 },
  "date_time_posted",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</record_id>

=back

=cut

__PACKAGE__->set_primary_key("record_id");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-12-01 16:39:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jiALUrzJ8V9FfilYzRWnzg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
