package LightOffCommand {
  use Mouse;

  with 'Command';

  has 'light' => (is => 'ro', isa => 'Light', required => 1);

  sub BUILDARGS {
    my ($class, $light) = @_;
    return { light => $light };
  }

  sub execute {
    my $self = shift;
    $self->light->off;
  }

  sub undo {
    my $self = shift;
    $self->light->on;
  }
}

1;
