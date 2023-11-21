package Comserv::Model::Encryption;
use Moose;
use Crypt::CBC;
use Crypt::OpenSSL::AES;
use MIME::Base64;
use JSON::MaybeXS;
use namespace::autoclean;

my $debug = "Comserv::Model::Encryption Line #";
print $debug . __LINE__ . "\n";
print $debug . __LINE__ . " Caller line: " . (caller(1))[2] . ", Caller sub: " . (caller(1))[3] . ", Caller Package: " . (caller(1))[0] . "\n";
has 'cipher' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        return Crypt::CBC->new(
            -key    => 'your_encryption_key',  # Replace with your encryption key
            -cipher => 'Crypt::OpenSSL::AES',
        );
    }
);

sub encrypt {
    my ($self, $data, $encryption_key) = @_;
my $cipher = Crypt::CBC->new(
    -key     => $encryption_key,
    -cipher  => 'Crypt::OpenSSL::AES',
    -padding => 'standard',
);    my $encrypted_data = $cipher->encrypt($data);
    return encode_base64($encrypted_data);
}

sub decrypt {
    my ($self, $encrypted_data, $decryption_key) = @_;
    my $cipher = Crypt::CBC->new(
        -key     => $decryption_key,  # Use $decryption_key instead of $encryption_key
        -cipher  => 'Crypt::OpenSSL::AES',
        -padding => 'standard',
    );
    my $data = decode_base64($encrypted_data);
    return $cipher->decrypt($data);
}
__PACKAGE__->meta->make_immutable;

1;