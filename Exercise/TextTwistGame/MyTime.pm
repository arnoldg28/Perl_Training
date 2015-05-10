package MyTime;

use warnings;
use strict;
use Time::HiRes qw(gettimeofday);
use Time::Local;
use Time::localtime;

sub printTime{
	my $t0 = gettimeofday;
	my $forlocaltime = int($t0);
	my $for_millisecond = int(($t0-$forlocaltime)*1000);
	my $tm = localtime($forlocaltime);
	printf ("Current Time- %02d:%02d:%02d:%03d %02d/%02d/%02d\n", $tm->hour, $tm ->min,$tm->sec,$for_millisecond, $tm->mday, $tm->mon+1, $tm->year+1900);
}1;