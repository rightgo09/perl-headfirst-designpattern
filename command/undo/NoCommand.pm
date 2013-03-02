package NoCommand {
  use Mouse;

  with 'Command';

  sub execute {}
  sub undo {}
}

1;
