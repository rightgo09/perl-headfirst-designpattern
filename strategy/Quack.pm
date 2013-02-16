package Quack {
  use Mouse;

  with 'QuackBehavior';

  sub quack {
    print "ガーガー\n";
  }
}

1;
