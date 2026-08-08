{...}: {
  programs.fish.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

}
