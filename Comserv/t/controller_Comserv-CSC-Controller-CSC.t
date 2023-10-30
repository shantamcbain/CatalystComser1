use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Comserv';
use Comserv::Controller::Comserv::CSC::Controller::CSC;

ok( request('/comserv/csc/controller/csc')->is_success, 'Request should succeed' );
done_testing();
