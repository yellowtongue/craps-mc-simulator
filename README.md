Simulate a number of craps hands and count outcomes.

Usage: perl dice.pl

Output:
Seq: (number of hands simulated)
Points Made: (number of times a point is established and made)
Dont: (number of times a point is established and not made - seven out - should equal Seq)
Natural: (number of times 7 or 11 rolled on the come out)
Craps: (number of times 2, 3, or 12 rolled on the come out)
All: (number of times "Make em All" bonus bet hit)
Tall: (number of times "All Small" bonus bet hit)
Small: (number of times "All Tall" bonus bet hit)

For more on Craps bonus bets, see https://wizardofodds.com/games/craps/side-bets/bonus-craps/

Top two lines in the file are variables for the number of sequences to run ($seq), and whether to run in debug mode ($debug).
Debug mode is actually more verbose mode. You will get printouts of each hand, as well as statements 
when bonus bet winning conditions are found. Debug mode also gives the count of each dice roll outcome 
(as opposed to hand outcomes) from the entire simulation.

Could be easily adopted for risk or ruin simulation or other purposes. 
The key loops are:
"for (1..$seq)" which runs hands
and
"while (! $seven_out)" which evaluates action and ends when the simulated shooter sevens out. 
