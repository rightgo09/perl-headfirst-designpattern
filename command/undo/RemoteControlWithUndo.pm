package RemoteControlWithUndo {
  use Mouse;
  use NoCommand;

  has 'on_commands' => (
    is => 'rw',
    isa => 'ArrayRef',
  );

  has 'off_commands' => (
    is => 'rw',
    isa => 'ArrayRef',
  );

  has 'undo_command' => (
    is => 'rw',
    does => 'Command',
  );

  sub BUILD {
    my $self = shift;
    $self->on_commands([]);
    $self->off_commands([]);

    my $no_command = NoCommand->new;
    for my $i (1..7) {
      $self->on_commands->[$i] = $no_command;
      $self->off_commands->[$i] = $no_command;
    }

    $self->undo_command($no_command);
  }

  __PACKAGE__->meta->make_immutable;

  sub set_command {
    my ($self, $slot, $on_command, $off_command) = @_;
    $self->on_commands->[$slot] = $on_command;
    $self->off_commands->[$slot] = $off_command;
  }

  sub on_button_was_pushed {
    my ($self, $slot) = @_;
    $self->on_commands->[$slot]->execute;
    $self->undo_command($self->on_commands->[$slot]);
  }

  sub off_button_was_pushed {
    my ($self, $slot) = @_;
    $self->off_commands->[$slot]->execute;
    $self->undo_command($self->off_commands->[$slot]);
  }

  sub undo_button_was_pushed {
    my ($self) = @_;
    $self->undo_command->undo;
  }
}

1;
