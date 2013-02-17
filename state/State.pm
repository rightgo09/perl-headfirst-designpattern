package State {
  use Mouse::Role;

  requires (
    'insert_quarter',
    'eject_quarter',
    'turn_crank',
    'dispense',
  );
}

1;
