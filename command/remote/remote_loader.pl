use strict;
use warnings;
use RemoteControl;
use Light;
use Stereo;
use LightOnCommand;
use LightOffCommand;
use StereoOnWithCDCommand;
use StereoOffCommand;

my $remote_control = RemoteControl->new;

my $living_room_light = Light->new('リビングルーム');
my $kitchen_light = Light->new('キッチン');
my $stereo = Stereo->new('リビングルーム');

my $living_room_light_on = LightOnCommand->new($living_room_light);
my $living_room_light_off = LightOffCommand->new($living_room_light);
my $kitchen_light_on = LightOnCommand->new($kitchen_light);
my $kitchen_light_off = LightOffCommand->new($kitchen_light);
my $stereo_on_with_CD = StereoOnWithCDCommand->new($stereo);
my $stereo_off = StereoOffCommand->new($stereo);

$remote_control->set_command(0, $living_room_light_on, $living_room_light_off);
$remote_control->set_command(1, $kitchen_light_on, $kitchen_light_off);
$remote_control->set_command(2, $stereo_on_with_CD, $stereo_off);

$remote_control->on_button_was_pushed(0);
$remote_control->on_button_was_pushed(1);
$remote_control->on_button_was_pushed(2);
