package GumballMachine {
  use Mouse;

  use NoQuarterState;
  use HasQuarterState;
  use SoldState;
  use SoldOutState;
  use WinnerState;

  has 'count' => (
    is => 'rw',
    isa => 'Int',
  );

  has 'state' => (
    is => 'rw',
    does => 'State',
    lazy => 1,
    builder => sub {
      my $self = shift;
      return $self->sold_out_state;
    },
  );

  has 'no_quarter_state' => (
    is => 'rw',
    isa => 'NoQuarterState',
  );

  has 'has_quarter_state' => (
    is => 'rw',
    isa => 'HasQuarterState',
  );

  has 'sold_state' => (
    is => 'rw',
    isa => 'SoldState',
  );

  has 'sold_out_state' => (
    is => 'rw',
    isa => 'SoldOutState',
  );

  has 'winner_state' => (
    is => 'rw',
    isa => 'WinnerState',
  );

  sub BUILDARGS {
    my ($class, $number_gumballs) = @_;
    return { count => $number_gumballs };
  }

  sub BUILD {
    my $self = shift;

    $self->no_quarter_state(NoQuarterState->new($self));
    $self->has_quarter_state(HasQuarterState->new($self));
    $self->sold_state(SoldState->new($self));
    $self->sold_out_state(SoldOutState->new($self));
    $self->winner_state(WinnerState->new($self));

    if ($self->count > 0) {
      $self->state($self->no_quarter_state);
    }
  }

  no Mouse;

  __PACKAGE__->meta->make_immutable;

  sub insert_quarter {
    my $self = shift;
    $self->state->insert_quarter;
  }

  sub eject_quarter {
    my $self = shift;
    $self->state->eject_quarter;
  }

  sub turn_crank {
    my $self = shift;
    $self->state->turn_crank;
    $self->state->dispense;
  }

  sub release_ball {
    my $self = shift;
    print "ガムボールがスロットから転がり出てきます……\n";
    if ($self->count != 0) {
      $self->count($self->count - 1);
    }
  }

  sub refill {
    my $self = shift;
    my $count = shift;
    $self->count($count);
    $self->state($self->no_quarter_state);
  }

  sub to_s {
    my $self = shift;
    my $result = "";
    $result .= "\nMighty Gumball, Inc.";
    $result .= "\nPerl対応据付型ガムボール　モデル#2013";
    $result .= "\n在庫:".$self->count."個のガムボール";
    $result .= "\nこのマシンは".$self->state->to_s;
    return $result;
  }
}

1;
