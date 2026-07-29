{ pkgs, inputs, ... }: {
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";

  environment.systemPackages = with pkgs; [
    # system bar
    waybar
    eww
    socat             # Required for IPC / Hyprland workspace listening

    hyprlock
    hypridle

    hyprshot
    cliphist
    wl-clipboard

    hyprlauncher
    hyprpolkitagent

    swaynotificationcenter

    # Theming tools
    nwg-look
    qt6Packages.qt6ct
    catppuccin-kde
    (colloid-gtk-theme.override {
      themeVariants = [ "default" ];   # accent hue: default/purple/pink/red/orange/yellow/green/teal/grey
      colorVariants = [ "dark" ];      # standard/light/dark
      sizeVariants = [ "standard" ];   # standard/compact
      tweaks = [ "catppuccin" ];       # optional: black/rimless/normal/float, or nord/dracula/gruvbox/everforest/catppuccin
    })
    colloid-icon-theme
    bibata-cursors

    # Utilities
    pavucontrol
    networkmanagerapplet
    brightnessctl
    playerctl
    grim
    slurp

    qt5.qtwayland
    qt6.qtwayland

    thunar

    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];

  fonts.packages = with pkgs; [
    comic-mono
  ];
}
