{
  inputs,
  myvars,
  ...
}: {
  imports = [
    ./desktop/wayland
    ./apps
    ./cli

    ./anyrun.nix
  ];

  home = {
    username = myvars.username;
    homeDirectory = "/home/${myvars.username}";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
