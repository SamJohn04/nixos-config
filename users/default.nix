{ lib, ... }: {
  imports =
  [
    ./samuel-john.nix
  ];

  samuel-john.enable = lib.mkDefault true;
}
