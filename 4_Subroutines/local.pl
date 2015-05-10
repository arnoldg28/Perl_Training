$string = "Hello, World!";

sub printHello{
	local $string;
	$string = "Hello, Perl!";
	printMe();
	print "Inside the function printHello $string\n";
}

sub printMe{
	print "Inside the function printMe $string\n";
}

printHello();
print "Outside the function $string\n";
