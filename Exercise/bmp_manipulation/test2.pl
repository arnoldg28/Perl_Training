#!/usr/bin/perl

use strict;

my $width = 180;
my $height = 180;

my $row_padding = (3 * $width) % 4;
$row_padding = $row_padding ? (4 - $row_padding) : 0;
my $row_size = 3 * $width + $row_padding;
my $data_size = $height * $row_size;

my $header_size = 54;
my $file_size = $header_size + $data_size;

my $file_name = 'file.bmp';

my $fh;

open($fh,'>',$file_name) or die "Could not open '$file_name' $!";

binmode($fh);

print $fh "\x42\x4D";               # BMP magic number
print $fh pack("V", $file_size);
print $fh "\0\0\0\0";               # Reserved
print $fh pack("V", $header_size);  # Offset to the image data

print $fh "\x28\0\0\0";          # Header size (40 bytes)
print $fh pack("V", $width);     # Bitmap width
print $fh pack("V", $height);    # Bitmap height
print $fh "\1\0";                # Number of color planes
print $fh "\x18\0";              # Bits per pixel (24-bits)
print $fh "\0\0\0\0";            # Compression method
print $fh pack("V", $data_size); # Image data size
print $fh "\x13\x0B\0\0";        # Horizontal resolution (px/m)
print $fh "\x13\x0B\0\0";        # Vertical resolution (px/m)
print $fh "\0\0\0\0";            # Number of colors in palette
print $fh "\0\0\0\0";            # Number of important colors

# Start of bitmap data
for (my $y = $height - 1; $y >= 0; $y = $y - 1)
{
      for (my $x = 0; $x < $width; $x = $x + 1)
      {
            # Function returns 24-bit pixel value
            # Color order must be (Blue, Green, Red)
            print $fh generate_image_data($x, $y);
      }

      for (my $p = 0; $p < $row_padding; $p = $p + 1)
      {
            print $fh "\0";
      }
}


sub generate_image_data
{
      my($x, $y) = @_;

      $x /= $width;
      $y /= $height;

      # Generate some pretty colors
      my $R = pack("C", 255 * $x);
      my $B = pack("C", 255 * $y);
      my $G = pack("C", int(255 * (1 - (($x + $y)/2))));

      return $B . $G . $R;
}

close $fh;