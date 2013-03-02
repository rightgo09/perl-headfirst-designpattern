use strict;
use warnings;
use RemoteControlWithUndo;
use Light;
use LightOnCommand;
use LightOffCommand;

my $remote_control = RemoteControlWithUndo->new;

my $living_room_light = Light->new('リビングルーム');

my $living_room_light_on = LightOnCommand->new($living_room_light);
my $living_room_light_off = LightOffCommand->new($living_room_light);

$remote_control->set_command(0, $living_room_light_on, $living_room_light_off);

$remote_control->on_button_was_pushed(0);
$remote_control->off_button_was_pushed(0);
$remote_control->undo_button_was_pushed;
$remote_control->off_button_was_pushed(0);
$remote_control->on_button_was_pushed(0);
$remote_control->undo_button_was_pushed;
