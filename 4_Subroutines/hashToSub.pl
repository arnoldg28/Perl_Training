sub printHash{
	my (%hash) = @_;
	
	foreach my $key ( keys %hash ){
	my $value = $hash{$key};
	print "$key : $value\n";
	}
print @_;
}

%hash = ('name'=> 'TOM','age'=>19);
printHash(%hash);
