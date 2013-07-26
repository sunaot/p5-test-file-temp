package Test::File::Temp;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use File::Temp qw( tempfile );

sub new {
    my ($class, %args) = @_;
    my %defaults = (
        suffix => '.tmp',
        text   => '',
    );
    my %options = ( %defaults, %args );
    my $filepath = $class->_tempfile($options{suffix}, $options{text});
    bless {
        filepath => $filepath,
    }, $class;
}

sub filepath {
    my $self = shift;
    return $self->{filepath};
}

sub _tempfile {
    my ($class, $suffix, $text) = @_;
    my ($fh, $filepath) = tempfile( SUFFIX => $suffix, UNLINK => 1 );
    print {$fh} $text;
    close $fh;
    return $filepath;
}


1;
__END__

=encoding utf-8

=head1 NAME

Test::File::Temp - Stub file to test

=head1 SYNOPSIS

    use Test::File::Temp;

    my $file = Test::File::Temp->new(
        suffix => '.yml',
        text   => YAML::Syck::Dump( hello => 'world' ),
    );

    $file->filepath; # path to test temp file

=head1 DESCRIPTION

Test::File::Temp is a real file test stub. It stubs file object on the fly.

=head1 METHODS

=over 4

=item $file = Test::File::Temp->new( suffix => <suffix>, text => <text> );

Creates a new C<Test::File::Temp> object and returns it. The
arguments optionally specify the suffix of the temporary file
and the text to write into the temporary file.

=item $file->filepath

Returns the file path to the generated temporary file.

=back

=head1 LICENSE

Copyright (C) sunaot

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sunaot E<lt>sunao.tanabe@gmail.comE<gt>

=cut

