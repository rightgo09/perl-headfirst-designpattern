package StereoOnWithCDCommand {
  use Mouse;

  with 'Command';

  has 'stereo' => (
    is => 'rw',
    isa => 'Stereo',
    required => 1,
  );

  sub BUILDARGS {
    my ($class, $stereo) = @_;
    return { stereo => $stereo };
  }

  __PACKAGE__->meta->make_immutable;

  sub execute {
    my $self = shift;
    $self->stereo->on;
    $self->stereo->set_CD;
    $self->stereo->set_volume(11);
  }
}

1;
