{ ... }: {
  environment.systemPackages = with pkgs; [
    hyprlauncher
    hyprpolkitagent
  ];

  systemd.user.services.hyprpolkitagent = {
    description = "Hyprland PolicyKit Agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.lib.getExe pkgs.hyprpolkitagent}";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
