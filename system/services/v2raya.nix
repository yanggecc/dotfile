{pkgs, ...}: {
  # V2RayA 代理管理服务（开机自启）
  services.v2raya = {
    enable = true;
    package = pkgs.v2raya;
    cliPackage = pkgs.xray;
  };
}
