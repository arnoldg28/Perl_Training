sub average{
	$n = scalar(@_);
	$sum = 0;

	foreach $item ( @_ ){
		$sum += $item;
		print "$sum \n";
	}
$average = $sum / $n;
return $average;
}

$num = average(10, 20, 30);

print "Average for the given numbers : $num \n";
