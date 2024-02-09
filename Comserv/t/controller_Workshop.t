use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Comserv';
use Comserv::Controller::Workshop;

ok( request('/workshop')->is_success, 'Request should succeed' );
done_testing();
