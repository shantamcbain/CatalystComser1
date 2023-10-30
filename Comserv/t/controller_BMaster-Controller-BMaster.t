use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Comserv';
use Comserv::Controller::BMaster::Controller::BMaster;

ok( request('/bmaster/controller/bmaster')->is_success, 'Request should succeed' );
done_testing();
