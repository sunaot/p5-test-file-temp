use Test::More;
use Test::File::Temp;
use Path::Class qw(file);

subtest 'filepath()' => sub {
    my $file = Test::File::Temp->new(
        suffix => '.yaml',
        text => 'accept',
    );

    subtest 'returns tempfile path' => sub {
        like $file->filepath, qr/\.yaml$/;
    };

    subtest '' => sub {
        is file($file->filepath)->slurp, 'accept';
    };
};


done_testing;
