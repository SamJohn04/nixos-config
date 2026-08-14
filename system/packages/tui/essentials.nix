{ pkgs, ... }: {
  programs.git = {
    enable = true;

    config = [{
      init = {
        defaultBranch = "main";
      };

      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff.interHunkContext = 10;

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
    }];
  };

  environment.systemPackages = with pkgs; [
    # cli: man man
    man
    man-pages
    man-pages-posix

    # audio stuff
    ffmpeg

    # pretty print
    bat
    tree
    unixtools.xxd

    # get stuff from servers
    wget

    # better find
    fd

    # json query
    jq

    pciutils

    # multiple terminals on screen, keeps working after detach, stuff like that
    tmux
  ];
}
