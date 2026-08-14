{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # C
    libgcc
    gcc
    glibc
    cmake
    gnumake
    pkg-config
    cppcheck
    clang-tools

    # Graphics library (for C)
    # raylib
  ];
}
