{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    flags = ["--disable-up-arrow"];
    settings = {
      auto_sync = false;
      update_check = false;
      filter_mode = "host";
      search_mode = "skim";
      style = "compact";
      inline_height = 7;
      show_help = false;
      enter_accept = true;
      keymap_mode = "vim-normal";
    };
  };
}