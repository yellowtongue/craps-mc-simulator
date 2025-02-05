#!/usr/bin/perl 
   $seq = 100;
   $debug = 0;

   @die = (1..6);

   my $text = '';

   $small_hit = 0;
   $tall_hit = 0;
   $all_hit = 0;
   $points_made = 0;
   %nums_overall = ();
   $natural = 0;
   $craps = 0;
   $dont_pass = 0;

   for (1..$seq) {
        $seven_out = 0;
	$point = 0;
        $res=0;
	$t = '';
	%nums = ();
	$all = 0;
	$allsmall = 0;
	$alltall = 0;
	while (! $seven_out) {
	   $a = $die[rand @die];
	   $b = $die[rand @die];
	   $res = $a + $b;
           $t .= "$res ";
	   $nums{$res}++;
	   $nums_overall{$res}++;
	   if ($point > 0 && $res == 7) {
	      $dont_pass++;
	      $seven_out = 1;
	   }
	   if ($point == 0) {
	      if ($res == 4 || $res == 5 || $res == 6 || $res == 8 || $res == 9 || $res == 10 ) {
	         $point = $res;
              } elsif ($res == 7 || $res == 11) {
		 $natural++;
              } elsif ($res == 2 || $res == 3 || $res == 12) {
		 $craps++;
	      }
           } else {
	      if ($res == $point) {
	         $point = 0;
		 $points_made++;
	      }
	   }
	   if (!$allsmall && $nums{2} && $nums{3} && $nums{4} && $nums{5} && $nums{6} && $nums{7} == 0) {
	      $allsmall = 1;
	      $small_hit++;
	      print "allsmall " if $debug;
           }
	   if (!$alltall && $nums{8} && $nums{9} && $nums{10} && $nums{11} && $nums{12} && $nums{7} == 0) {
	      $alltall = 1;
	      $tall_hit++;
	      print "alltall " if $debug;
           }
	   if (!$all && $alltall && $allsmall) {
       	      $all = 1;
	      $all_hit++;
	      print "allornothingatall " if $debug;
	   }
        }
	print "$t\n" if $debug;
	print "\n" if $debug;
   }

   print "Seq: $seq\nPoints Made: $points_made\nDont: $dont_pass\nNatural: $natural\nCraps: $craps\n";
   print "All: $all_hit\nTall:$tall_hit\nSmall:$small_hit\n";

   if ($debug) {
      foreach (sort keys %nums_overall) {
         print "$_ $nums_overall{$_}\n";
      }
   }
