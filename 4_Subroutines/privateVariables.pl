$string = "Hello, Global";

sub printPrivate{
	my $string;
	$string = "Hello, local!";
	print "Inside the function $string\n";
}

printPrivate();
print "Outside the fuction $string\n"; 
