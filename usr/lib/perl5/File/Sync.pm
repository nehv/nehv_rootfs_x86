# File::Sync.pm
#
# Copyright © 1997,1999 Carey Evans.  All rights reserved.  This module is
# free software; you can redistribute it and/or modify it under the same
# terms as Perl itself.

package File::Sync;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require DynaLoader;
require AutoLoader;

use Carp;
use Symbol qw(qualify_to_ref);

@ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default.
@EXPORT = ();
@EXPORT_OK = qw(
	sync
	fsync
	fsync_fd
);
$VERSION = '0.09';

bootstrap File::Sync $VERSION;

# Preloaded methods go here.

# Interface from Perl filehandle to POSIX file descriptor.
sub fsync(*) {
    @_ == 1 or croak "usage: fsync FILEHANDLE";

    fsync_fd(fileno(qualify_to_ref($_[0], caller())));
}

# Make fsync a method of IO::Handle and FileHandle.
*IO::Handle::fsync = *FileHandle::fsync = \&fsync;

1;
__END__

=head1 NAME

File::Sync - Perl access to fsync() and sync() function calls

=head1 SYNOPSIS

  use File::Sync qw(fsync sync);
  fsync(\*FILEHANDLE) or die "fsync: $!";
  sync();

  use File::Sync qw(fsync);
  use IO::File;
  $fh = IO::File->new("> /tmp/foo") 
      or die "new IO::File: $!";
  ...
  fsync($fh) or die "fsync: $!";

=head1 DESCRIPTION

The fsync() function takes a Perl file handle as its only argument, and
passes its fileno() to the C function fsync().  It returns I<undef> on
failure, or I<true> on success.

The fsync_fd() function is used internally by fsync(); it takes a file
descriptor as its only argument.

The sync() function is identical to the C function sync().

This module does B<not> export any methods by default, but fsync() is
made available as a method of the I<FileHandle> and I<IO::Handle>
classes.

=head1 NOTES

Doing fsync() if the stdio buffers aren't flushed (with C<$|> or the
I<autoflush> method) is probably pointless.

Calling sync() too often on a multi-user system is slightly antisocial.

=head1 AUTHOR

Carey Evans <I<c.evans@clear.net.nz>>

=head1 SEE ALSO

perl(1), fsync(2), sync(2), perlvar(1)

=cut
