# my truly creates local variables
# local operator does not create new variable, value is available to the block and to the called subroutines.

########### Sample 1 ##############  
$a = 20; #Global Variable
{
	local($a); #save $a's old value, new value is undef
	my (@b); #Lexical variable
	$a = 10; # Modify $a's new value
	@b = ("wallace","gromit");
	print $a;
	print "\n";
	print "@b";
	print "\n";
}
#Block Ended. Back to globat scope where only $a is valid.
print $a;
print "\n";
print @b;

###################################


########### Sample 2 ##############
$x = $10;

first();

sub first(){
	local ($x)="zen";
	second();
}

sub second(){
	print $x;
}

