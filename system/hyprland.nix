{ pkgs, inputs, ... }: {
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";

  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;

    systemd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    socat             # Required for IPC / Hyprland workspace listening

    cliphist
    wl-clipboard

    hyprpolkitagent

    # Theming tools
    nwg-look
    qt6Packages.qt6ct

    # Utilities
    pavucontrol
    networkmanagerapplet
    brightnessctl
    playerctl
    grim
    slurp

    qt5.qtwayland
    qt6.qtwayland

    (yazi.override {
		  _7zz = _7zz-rar;  # Support for RAR extraction
      })
  ];

  fonts.packages = with pkgs; [
    comic-mono
  ];
}
