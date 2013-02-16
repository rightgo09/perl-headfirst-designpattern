package Squeak {
  use Mouse;

  with 'QuackBehavior';

  sub quack {
    print "キューキュー\n";
  }
}

1;
