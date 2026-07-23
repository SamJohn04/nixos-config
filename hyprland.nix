{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpolkitagent
  ];
}
