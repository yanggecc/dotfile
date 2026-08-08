{...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza --icons=auto";
      ll = "eza -la --icons=auto";
      la = "eza -a --icons=auto";
      cat = "bat --theme=gruvbox-dark";
      v = "nvim";
    };
    initExtra = ''
      proxy() {
        export http_proxy=http://127.0.0.1:20171
        export https_proxy=http://127.0.0.1:20171
        export all_proxy=socks5://127.0.0.1:20170
        export socks_proxy=socks5://127.0.0.1:20170
        echo "proxy enabled"
      }
      unproxy() {
        unset http_proxy https_proxy all_proxy socks_proxy
        echo "proxy disabled"
      }
    '';
  };
}
