package ModelDuck {
  use Mouse;

  extends 'Duck';
  use Quack;
  use FlyNoWay;

  sub BUILD {
    my $self = shift;
    $self->quack_behavior(Quack->new);
    $self->fly_behavior(FlyNoWay->new);
  }

  sub display {
    print "模型の鴨です\n";
  }
}

1;
