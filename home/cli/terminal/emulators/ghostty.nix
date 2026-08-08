{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    installVimSyntax = true;
    settings = {
      theme = "Gruvbox Dark";
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 14;
      font-feature = ["calt" "dlig" "liga"];
      cursor-style = "block";
      cursor-style-blink = false;
      window-padding-x = 12;
      window-padding-y = 12;
      shell-integration = "fish";
      scrollback-limit = 10000;
      macos-option-as-alt = "left";
      window-decoration = "none";
    };
  };
}
