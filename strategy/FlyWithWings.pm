package FlyWithWings {
  use Mouse;

  with 'FlyBehavior';

  sub fly {
    print "飛んでいます！！\n";
  }
}

1;
