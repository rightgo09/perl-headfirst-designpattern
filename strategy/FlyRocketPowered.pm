package FlyRocketPowered {
  use Mouse;

  with 'FlyBehavior';

  sub fly {
    print "ロケットで飛んでいます！\n";
  }
}

1;
