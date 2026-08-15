{ pkgs, ... }: {
  home.username = "samuel-john";
  home.homeDirectory = "/home/samuel-john";

  home.packages = with pkgs; [
    btop
    fastfetch
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Samuel John";
        email = "samuel.john.codes@gmail.com";
      };
      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };
      credential = {
        helper = "cache";
      };
      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
      diff = {
        interHunkContext = 10;
      };
      push = {
        autoSetupRemote = true;
        default = "current";
      };
      pull = {
        default = "current";
        rebase = true;
      };
      rebase = {
        autoStash = true;
        missingCommitsCheck = "warn";
      };
    };
  };

  xdg.configFile."hypr".source = ./modules/hypr;
  xdg.configFile."noctalia".source = ./modules/noctalia;

  home.stateVersion = "26.05";
}
