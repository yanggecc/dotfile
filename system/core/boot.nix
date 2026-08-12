{pkgs, ...}: {
  boot = {
    initrd = {
      systemd.enable = true;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "plymouth.use-simpledrm"
      "amdgpu.dcdebugmask=0x10"
    ];

    loader = {
      # systemd-boot on UEFI
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.graceful = true;
      # 限制保留的启动项数量（自动清理旧 generations）
      systemd-boot.configurationLimit = 10;
    };

    # 开机动画主题：bgrt 显示 UEFI 固件 Logo（ThinkBook/Lenovo）
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };
}
