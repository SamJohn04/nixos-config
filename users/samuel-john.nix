{ config, pkgs, lib, ... }: {
  options = {
    samuel-john.enable = lib.mkEnableOption "enables samuel-john";
  };

  config = lib.mkIf config.samuel-john.enable {
    # Don't forget to set a password with ‘passwd’.
    users.users.samuel-john = {
      isNormalUser = true;
      description = "Samuel John";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        # terminal
        kitty

        # browser
        brave

        # Game Dev
        godot_4

        libnotify
        udiskie

        libreoffice

        kdePackages.kate

        # art
        gimp-with-plugins
        krita

        obsidian
      ];
    };
  };
}
