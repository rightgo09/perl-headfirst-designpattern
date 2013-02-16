package FlyNoWay {
  use Mouse;

  with 'FlyBehavior';

  sub fly {
    print "飛べません\n";
  }
}

1;
