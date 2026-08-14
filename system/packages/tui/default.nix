{ ... }: {
  imports =
  [
    ./essentials.nix
    ./nvim.nix
    ./postgres.nix
    ./mariadb.nix
  ];
}
