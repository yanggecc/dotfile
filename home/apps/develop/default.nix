{pkgs, ...}: {
  home.packages = with pkgs; [
    # Python 运行时
    python3
  ];
}
