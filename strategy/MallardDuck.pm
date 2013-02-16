package MallardDuck {
  use Mouse;

  extends 'Duck';
  use Quack;
  use FlyWithWings;

  sub BUILD {
    my $self = shift;
    $self->quack_behavior(Quack->new);
    $self->fly_behavior(FlyWithWings->new);
  }

  sub display {
    print "本物のマガモです\n";
  }
}

1;
