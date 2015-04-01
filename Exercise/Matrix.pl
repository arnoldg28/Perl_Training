# The application will only ask the size (row and col) once.
# This will force the two matrices to be the same size.
#Practical Extraction and Report Language
use warnings;
no warnings 'all';

print "==== Adding Two Matrix ==== \n";
print "Enter dimension: \n";
print "*Note the this will apply on both Matrices \n";

print "Enter Row: \n";
$row = <STDIN>;
print "Enter Col: \n";
$col = <STDIN>;

print "\n";

print "Enter value for Matrix 1: \n";
@matrix_1 = enterValue($col,$row);

print "\n";

print "Enter value for Matrix 2: \n";
@matrix_2 = enterValue($col,$row);

print "\n";
print "OUTPUT: \n";

for($x=0;$x<$col;$x++){
	for($y=0;$y<$row;$y++){
		print $matrix_1[$x][$y] + $matrix_2[$x][$y];
		print " ";
	}
	print "\n";
}

sub enterValue(){
	@args = @_;
	
	local $m_col = $args[0];
	local $m_row = $args[1];
	local @matrix;
	
	for($x=0;$x<$m_col;$x++){
		for($y=0;$y<$m_row;$y++){
			print "Enter value for row $y : col $x =>";
			$val = <STDIN>;
			$matrix[$x][$y] = $val;
		}
	}
	
	return @matrix;	

}
