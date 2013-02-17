package SoldState {
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
    print "お待ちください。すでにガムボールを出しています\n";
  }

  sub eject_quarter {
    print "申し訳ありません。すでにクランクを回しています\n";
  }

  sub turn_crank {
    print "2回回してもガムボールをもう一つ手に入れることはできません！\n";
  }

  sub dispense {
    my $self = shift;
    $self->gumball_machine->release_ball;
    if ($self->gumball_machine->count > 0) {
      $self->gumball_machine->state($self->gumball_machine->no_quarter_state);
    }
    else {
      print "おっと、ガムボールがなくなりました！\n";
      $self->gumball_machine->state($self->gumball_machine->sold_out_state);
    }
  }

  sub to_s {
    return "ボールを出します";
  }
}

1;
