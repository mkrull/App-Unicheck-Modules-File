package Uninets::Check::Modules::File;

use 5.10.1;
use strict;
use warnings FATAL => 'all';
use Moo;
use Getopt::Long qw(GetOptionsFromArray);
use Try::Tiny;
use JSON;

=head1 NAME

Uninets::Check::Modules::File - Uninets::Check module to check files.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Uninets::Check::Modules::File is able to check file size, modification times, content and more.

	# to show available information on parameters run
	unicheck --info File

=cut

sub run {
	my ($self, $action, @params) = @_;

	$self->$action(@params);
}

=head1 ACTIONS

=head2 exists

Check if a file exists/is accessable.

	unicheck File exists --path /path/to/file

=cut

sub exists {
	my ($self, @params) = @_;
    # TODO
}

=head2 size

Get the size of a file in bytes.

	unicheck File size --path /path/to/file

=cut

sub size {
	my ($self, @params) = @_;
    # TODO
}

=head2 mtime

Get the last modification time as timestamp.

	unicheck File mtime --path /path/to/file

=cut

sub mtime {
	my ($self, @params) = @_;
    # TODO
}

=head2 content

Check content against a string or regex.

	unicheck File content --path /path/to/file --match 'unicheck\sis\s+easy.*use' --flags g

=cut

sub content {
	my ($self, @params) = @_;
    # TODO
}

sub _return {
	my ($self, $status, $value, $format) = @_;

	return JSON->new->encode(
		{
			message => $value,
			status  => $status,
		}
	) if $format eq 'json';
	# default last in case some non supported format was given
	return $status; # if $format eq 'num'
}

sub help {
	{
		description => 'Check web server and web app status',
		actions => {
			exists => {
				description => 'Checks existence',
				params => {
					'--path'       => 'Mandatory path information',
				},
				formats => {
					'num'  => 'Returns 1 if the file exists, 0 otherwise',
					'json' => 'Returns a JSON structure',
				},
				default_format => 'num',
			},
			size => {
				description => 'Get file size',
				params => {
					'--path'       => 'Mandatory path information',
				},
				formats => {
					'num'  => 'Returns the size in byte',
					'json' => 'Returns a JSON structure',
				},
				default_format => 'num',
			},
			mtime => {
				description => 'Get last modification time',
				params => {
					'--path'       => 'Mandatory path information',
				},
				formats => {
					'num'  => 'Returns the timestamp',
					'json' => 'Returns a JSON structure',
				},
				default_format => 'num',
			},
			content => {
				description => 'Check if content matches',
				params => {
					'--path'       => 'Mandatory path information',
					'--match'      => 'Regular expresson (Beware, regexes can contain exacutable code!)',
                    '--flags'      => 'Regex flags',
				},
				formats => {
					'num'  => 'Returns count of matches',
					'json' => 'Returns a JSON structure',
				},
				default_format => 'num',
			},
		},
	}
}


=head1 AUTHOR

Matthias Krull, C<< <<m.krull at uninets.eu>> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-uninets-check-modules-file at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Uninets-Check-Modules-File>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Uninets::Check::Modules::File


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Uninets-Check-Modules-File>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Uninets-Check-Modules-File>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Uninets-Check-Modules-File>

=item * Search CPAN

L<http://search.cpan.org/dist/Uninets-Check-Modules-File/>

=item * Github

L<http://github.com/uninets/Uninets-Check-Modules-File/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Matthias Krull.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Uninets::Check::Modules::File
