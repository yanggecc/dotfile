{
  inputs,
  self,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
        default.path = "${self}/assets/wallpaper/wallhaven-pkwxxm_3840x2160.png";
      };
    };
  };
}
