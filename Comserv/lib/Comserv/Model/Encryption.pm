package Comserv::Model::Encryption;
use Moose;
use Crypt::CBC;
use MIME::Base64;

has 'cipher' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        return Crypt::CBC->new(
            -key    => 'your_encryption_key',  # Replace with your encryption key
            -cipher => 'Blowfish',
        );
    }
);

sub encrypt {
    my ($self, $data) = @_;
    my $cipher = $self->cipher;
    my $encrypted_data = $cipher->encrypt($data);
    return encode_base64($encrypted_data);
}

sub decrypt {
    my ($self, $encrypted_data) = @_;
    my $cipher = $self->cipher;
    my $data = decode_base64($encrypted_data);
    return $cipher->decrypt($data);
}

__PACKAGE__->meta->make_immutable;

1;
