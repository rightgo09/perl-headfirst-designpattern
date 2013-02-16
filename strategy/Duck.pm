package Duck {
  use Mouse;

  has quack_behavior => (
    is => 'rw',
    does => 'QuackBehavior',
    handles => {
      perform_quack => 'quack',
    },
  );

  has fly_behavior => (
    is => 'rw',
    does => 'FlyBehavior',
    handles => {
      perform_fly => 'fly',
    },
  );

  no Mouse;

  __PACKAGE__->meta->make_immutable;

  sub display {
    die "This method is abstract method!";
  }

  sub swim {
    print "すべての鴨は浮かびます。おとりの鴨でも！\n";
  }
}

1;
