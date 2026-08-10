{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-fluent # 主题皮肤
      (fcitx5-rime.override {
        rimeDataPkgs = [
          pkgs.rime-ice
        ];
      })
    ];
  };

  environment.variables = {
    GLFW_IM_MODULE = "ibus";
    XMODIFIERS = "@im=fcitx";
  };
}
