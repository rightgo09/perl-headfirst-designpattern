package SimpleRemoteControl {
  use Mouse;

  has 'slot' => (is => 'rw', does => 'Command');

  sub set_command {
    my $self = shift;
    my $command = shift;
    $self->slot($command);
  }

  sub button_was_pressed {
    my $self = shift;
    $self->slot->execute;
  }
}

1;
