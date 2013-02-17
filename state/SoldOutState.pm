package SoldOutState {
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
    print "25セントを投入することはできません。このマシンは売り切れです\n";
  }

  sub eject_quarter {
    print "返金できません。まだ25セントを投入していません\n";
  }

  sub turn_crank {
    print "クランクを回しましたが、ガムボールがありません\n";
  }

  sub dispense {
    print "販売するガムボールはありません\n";
  }

  sub to_s {
    return "売り切れです";
  }
}

1;
