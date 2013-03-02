package Light {
  use Mouse;

  has 'location' => (is => 'rw', isa => 'Str');

  sub BUILDARGS {
    my ($class, $location) = @_;
    return { location => $location };
  }

  sub on {
    my $self = shift;
    print $self->location." 照明がついています\n";
  }

  sub off {
    my $self = shift;
    print $self->location." 照明が消えています\n";
  }
}

1;
