{pkgs, ...}: {
  # Install fonts.
  fonts.packages = with pkgs; [
    (nerd-fonts.jetbrains-mono)
    (nerd-fonts.zed-mono)
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
