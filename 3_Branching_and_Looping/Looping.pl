print "========================================================================================\n";
print "## LOOPING STATEMENTS ## \n";

print "while statement: \n";
$x = 0;
while($x<5){
	print $x++ . "\n";
}

print "\n\n";

print "unltil loop: \n";
$y = 0;
until($y==5){
	print "until $y";
	$y++;print "\n";	
}

print "\n\n";
print "do-while and do-until: \n";

$x=0;
do{
$x++;
print "do-while \n";
}while($x<5);

print "\n";

$y = 0;
do{
	$y++;
	print "do-until\n";
}until($y==5);

#Breaking out from blocks
#-last
#-redo
#-next
#-goto

print "\n\n";

print "This is a for-loop \n";
for($a=0;$a<5;$a++){
	print "loop " . $a . "\n";
}

print "\n\n";

print "This is a last function in Perl \n";
$count = 0;
while( 1 ){
   $count = $count + 1;
   if( $count > 4 ){
       print "Going to exist out of the loop\n";
       last;
   }else{
       print "Count is $count\n";
   }
}
print "Out of the loop\n";

print "\n\n";

print "last with LABEL: \n\n";
$a = 0;
OUTER: while( $a < 4 ){
   $b = 0;
   print "value of a: $a\n";
   INNER:while ( $b < 4){
      if( $a == 2){
          # terminate outer loop
          last OUTER;
      }
      $b = $b + 1;
      print "Value of b : $b\n";
   }
   print "\n";
   $a = $a + 1;
}


print "\n\n";

# Redo - Redo the whole block
print "#### REDO #### \n";
{
    print("What is your name? ");
    $name = <STDIN>;
    chop($name);

    if (! length($name)) {
        print("Msg: Zero length input. Please try again\n");
        redo;
    }

    print("Thank you, " . uc($name) . "\n");
}


print "\n\n";

