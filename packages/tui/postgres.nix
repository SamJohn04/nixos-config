{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;  # or _15, _17, etc.
    authentication = pkgs.lib.mkOverride 10 ''
    # trust local connections for convenience (dev only!)
    local all all trust
    '';
  };
}
