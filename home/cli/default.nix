{pkgs, ...}: {
  imports = [
    ./terminal
  ];

  home.packages = with pkgs; [
    bat
    eza
    fd
    ripgrep
    fzf
    jq
    curl
    wget
    git
    lazygit
    gh
  ];
}
