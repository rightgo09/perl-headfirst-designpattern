use strict;
use warnings;
use SimpleRemoteControl;
use Light;
use LightOnCommand;

my $remote = SimpleRemoteControl->new;
my $light = Light->new;
my $light_on = LightOnCommand->new($light);

$remote->set_command($light_on);
$remote->button_was_pressed;

