package MuteQuack {
  use Mouse;

  with 'QuackBehavior';

  sub quack {
    print "<<沈黙>>\n";
  }
}

1;
