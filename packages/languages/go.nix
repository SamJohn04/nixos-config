{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    go
    gopls
    gotools
    golangci-lint
    delve

    go-outline
    go-symbols
  ];
}
