## Sort funciton ###

## For Strings
@arr = qw (z x y);

@arr2 = sort @arr;
print @arr2;

print "\n\n";

## For String ver2
@arr3 = sort{$a cmp $b}@arr;
print @arr3;

print "\n\n";

##For numbers
@arr_num = (3,2,1);

@arr_num2 = sort{$a <=> $b}@arr_num;

print @arr_num2; 	



