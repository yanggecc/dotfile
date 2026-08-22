# default.nix
{ pkgs, inputs, ... }: 

let
  # 本地直接定义好这两个包
  aria2Next = pkgs.callPackage ./aria2-next.nix { };
  ccSwitch = pkgs.callPackage ./cc-switch.nix { };
  traeCode = pkgs.callPackage ./traecode.nix { src = inputs.traecode; };
in {
  
  imports = [
    ./motrix-next.nix
  ];

  # 关键点：通过 _module.args 将变量安全地传递给 imports 里的所有子模块
  _module.args = {
    inherit aria2Next;
  };

  home.packages = [
    pkgs.imagemagick
    pkgs.fastfetch
    pkgs.playerctl
    
    aria2Next   # 安装自定义 aria2-next
    traeCode    # 安装 TraeCode（本地 deb 解包）
    # ccSwitch    # 安装自定义 cc-switch
    # workx 通过 flake 安装（见 ~/.dotfile/flake.nix 的 inputs.workx）
    inputs.workx.packages.${pkgs.system}.default
  ];
}
