use strict;
use warnings;

use GumballMachine;

my $gumball_machine = GumballMachine->new(5);

print $gumball_machine->to_s, "\n";

$gumball_machine->insert_quarter;
$gumball_machine->turn_crank;

print $gumball_machine->to_s, "\n";

$gumball_machine->insert_quarter;
$gumball_machine->turn_crank;
$gumball_machine->insert_quarter;
$gumball_machine->turn_crank;

print $gumball_machine->to_s, "\n";
