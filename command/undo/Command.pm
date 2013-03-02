package Command {
  use Mouse::Role;

  requires 'execute';
  requires 'undo';
}

1;
