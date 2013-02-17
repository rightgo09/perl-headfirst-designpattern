package HasQuarterState {
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
    print "もう一度25セントを投入することはできません\n";
  }

  sub eject_quarter {
    my $self = shift;
    print "25セントを返却します\n";
    $self->gumball_machine->state($self->gumball_machine->no_quarter_state);
  }

  sub turn_crank {
    my $self = shift;
    print "クランクを回しました……\n";
    if (int(rand(10)) == 0) {
      $self->gumball_machine->state($self->gumball_machine->winner_state);
    }
    else {
      $self->gumball_machine->state($self->gumball_machine->sold_state);
    }
  }

  sub dispense {
    print "販売するガムボールはありません\n";
  }

  sub to_s {
    return "クランクが回されるのを待っています";
  }
}

1;
