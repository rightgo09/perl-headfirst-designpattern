use strict;
use warnings;

use MallardDuck; # マガモ
use ModelDuck;   # 鴨模型

my $duck;

$duck = MallardDuck->new;

$duck->perform_quack; #=> ガーガー
$duck->perform_fly;   #=> 飛んでいます！！
$duck->swim;          #=> すべての鴨は浮かびます。おとりの鴨でも！

$duck = ModelDuck->new;

$duck->perform_fly; #=> 飛べません
use FlyRocketPowered;
$duck->fly_behavior(FlyRocketPowered->new);
$duck->perform_fly; #=> ロケットで飛んでいます！
