package Stereo {
  use Mouse;
 
  has 'location' => (is => 'ro', isa => 'Str');

  sub BUILDARGS {
    my ($class, $location) = @_;
    return { location => $location };
  }

  sub on {
    my $self = shift;
    print $self->location." ステレオの電源が入っています\n";
  }

  sub off {
    my $self = shift;
    print $self->location." ステレオの電源が切れています\n";
  }

  sub set_CD {
    my $self = shift;
    print $self->location." ステレオがCD入力に設定されています\n";
  }

  sub set_volume {
    my $self = shift;
    my $volume = shift;
    print "ステレオのボリュームが".$volume."に設定されています\n";
  }

}

1;
