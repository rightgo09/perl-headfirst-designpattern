package NoQuarterState {
  use Mouse;

  with 'State';

  has 'gumball_machine' => (
    is => 'rw',
    isa => 'GumballMachine',
  );

  sub BUILDARGS {
    my ($class, $gumball_machine) = @_;
    return { gumball_machine => $gumball_machine };
  }

  sub insert_quarter {
    my $self = shift;
    print "25セントを投入しました\n";
    $self->gumball_machine->state($self->gumball_machine->has_quarter_state);
  }

  sub eject_quarter {
    print "25セントを投入していません\n";
  }

  sub turn_crank {
    print "クランクを回しましたが、25セントを投入していません\n";
  }

  sub dispense {
    print "まず支払いをする必要があります\n";
  }

  sub to_s {
    return "25セントが投入されるのを待っています";
  }
}

1;
