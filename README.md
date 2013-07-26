# NAME

Test::File::Temp - Stub file to test

# SYNOPSIS

    use Test::File::Temp;

    my $file = Test::File::Temp->new(
        suffix => '.yml',
        text   => YAML::Syck::Dump( hello => 'world' ),
    );

    $file->filepath; # path to test temp file

# DESCRIPTION

Test::File::Temp is a real file test stub. It stubs file object on the fly.

# METHODS

- $file = Test::File::Temp->new( suffix => <suffix>, text => <text> );

    Creates a new `Test::File::Temp` object and returns it. The
    arguments optionally specify the suffix of the temporary file
    and the text to write into the temporary file.

- $file->filepath

    Returns the file path to the generated temporary file.

# LICENSE

Copyright (C) sunaot

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

sunaot <sunao.tanabe@gmail.com>
