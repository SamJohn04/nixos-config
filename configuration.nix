{ config, pkgs, ... }:
{
  imports =
  [
    /etc/nixos/hardware-configuration.nix
    ./users
    ./packages/tui
    ./packages/gui
    ./packages/languages
    ./hardware/nvidia.nix
    ./hyprland.nix
  ];

  #
  # Important: Change *only* if necessay
  #

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; # so nixos can see other installed systems

  # Networking
  networking.hostName = "nixos-home-hp"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Setting up my swap RAM
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GiB
  }];

  # enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # disks
  services.udisks2.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  # enable hyprland
  programs.hyprland.enable = true;

  # Enable dconf (some GTK apps/theming tools expect it)
  programs.dconf.enable = true;

  # Thumbnails in file managers, screenshot previews etc.
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Printing
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # enable cache
  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
  };

  #
  # Other Stuff, Go Nuts
  #

  # starship
  programs.starship = {
    enable = true;
  };

  # for easier execution of dlls
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Steam
  programs.steam.enable = true;

  # for certain man pages
  documentation.dev.enable = true;

  environment.shellAliases = {
    # ls stuff
    l = "ls -ahl";
    ll = "ls -l";
    ls = "ls --color=tty";

    # git stuff
    gi = "git init";
    ga = "git add";
    gap = "git add --patch";
    gc = "git commit";
    gs = "git status --short";
    gur = "git push";
    gul = "git pull";
    gcl = "git clone";
    gd = "git diff";
    gl = "git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D\n%s\n'";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts
    noto-fonts-color-emoji
  ];

  environment.sessionVariables = {
    # run man pkg-config
    PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
