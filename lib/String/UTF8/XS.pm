package String::UTF8::XS;
use strict;
use warnings;

BEGIN {
    our $VERSION   = 0.1;
    our @EXPORT_OK = qw(
        is_utf8
        UTF8_DISALLOW_NONCHARACTERS
    );

    require XSLoader;
    XSLoader::load(__PACKAGE__, $VERSION);

    require Exporter;
    *import = \&Exporter::import;
}

1;

__END__

=head1 NAME

String::UTF8::XS - XS implementation of String::UTF8

=head1 DESCRIPTION

The main L<String::UTF8> package will use this package automatically if it 
can find it. Do not use this package directly, use L<String::UTF8> instead.

=head1 AUTHOR

Christian Hansen, E<lt>chansen@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Christian Hansen

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
