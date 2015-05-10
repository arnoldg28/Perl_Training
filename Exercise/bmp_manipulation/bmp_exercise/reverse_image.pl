my $orig_bmp_file = "orig.bmp";
my $reverse_bmp_file = "reverse.bmp"; 

open bmp_file, $orig_bmp_file or die $!;

my $bmp_HEADER; #1
read bmp_file,$bmp_HEADER,14;

print "=== BMP Header === \n";

	my $id_field_orig = substr $bmp_HEADER,0,2;
		print "ID Field (string): $id_field_orig \n";
	
	my $size_bmp_orig = substr $bmp_HEADER,2,4;
		my $size_bmp_bytes = unpack('V',$size_bmp_orig);
		print "Size (long): $size_bmp_bytes bytes\n";
	
	my $unused_orig = substr $bmp_HEADER,6,4;
		my $unused = unpack("H*",$unused_orig);
		print "Unused (Hex): $unused \n";
	
	my $offset_orig = substr $bmp_HEADER,10,4;
		#Will be used to get the pixel array
		my $offset = unpack('V',$offset_orig);
		print "Offset (long): $offset \n";
	
print "\n";

print "=== DIB Header ===\n";
my $dib_total_bytes_orig; #2
read bmp_file,$dib_total_bytes_orig,4; 
		
		#Will be used to get all the DIB header
		 my $dib_total_bytes = unpack('V',$dib_total_bytes_orig);
		 print "DIB Header Total bytes: $dib_total_bytes \n";

my $remaining_DIB_HEADER; #3
read bmp_file,$remaining_DIB_HEADER,($dib_total_bytes-4);

#Here we only care for the first 5 structure for the processing of the pixel array
	my $width_orig = substr $remaining_DIB_HEADER,0,4;
		#Will be used for the computation
		my $width = unpack('V',$width_orig);
		print "Width (long): $width \n";
		
	my $height_orig = substr $remaining_DIB_HEADER,4,4;
		#Will be used for the computation
		my $height = unpack('V',$height_orig);
		print "Height (long): $height \n";
	
	#plane skipped, not needed.
	
	my $bit_per_pixel_orig = substr $remaining_DIB_HEADER,10,2;
		#will be used in the computation
		my $bit_per_pixel = unpack('v',$bit_per_pixel_orig);
		print "Bit per pixel (long): $bit_per_pixel \n";
	
my $pixel_ARRAY;
read bmp_file,$pixel_ARRAY,($size_bmp_bytes-$offset);

my $inverted_pixel_ARRAY = reverse($pixel_ARRAY); #4

#WRITING OF FILE

my $fh;
open($fh,'>',$reverse_bmp_file) or die "Could not open $!";

print $fh $bmp_HEADER;
print $fh $dib_total_bytes_orig;
print $fh $remaining_DIB_HEADER;
print $fh $inverted_pixel_ARRAY;

close $fh;
close bmp_file;

print "Reversing image successful!";
#use bytes;
#print bytes::length($pixel_ARRAY);
#print $pixel_ARRAY;

#use bytes;
#print bytes::length($remaining_DIB_HEADER);

