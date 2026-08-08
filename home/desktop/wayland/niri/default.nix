{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./settings.nix
    ./binds.nix
    ./rules.nix
  ];

  # 与系统 NixOS 模块使用相同 niri 包，避免 niri-flake 自带包与 nixpkgs 版本不兼容
  programs.niri.package = pkgs.niri;

  home.packages = with pkgs; [
    seatd
    jaq
  ];
}
