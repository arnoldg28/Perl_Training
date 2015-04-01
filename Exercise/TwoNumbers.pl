sub add{
	($a,$b) = @_;
	$sum = $a + $b;
	return $sum;
}

print "Adding two numbers \n";
print "Enter 1st number: ";
$num1 = <STDIN>;
print "Enter 2nd number: ";
$num2 = <STDIN>;
print "\n";

print "Result: ";
print add($num1,$num2);
