sub average{
	$n = scalar(@_);
	$sum = 0;

	foreach $item ( @_ ){
		$sum += $item;
		print "$sum \n";
	}
$average = $sum / $n;
print "Average for the given numbers : $average \n";

}

average(10, 20, 30);
