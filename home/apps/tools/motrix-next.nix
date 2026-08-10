{ pkgs, aria2Next, ... }: {
  home.packages = [
    (pkgs.motrix-next.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        # 1. 强制递归创建所有可能用到的 sidecar 存放目录，防止 ln 找不到路径报错
        mkdir -p $out/lib/motrix-next/sidecars
        mkdir -p $out/bin
        
        # 2. 建立标准的 sidecar 软链接
        ln -sf ${aria2Next}/bin/aria2-next $out/lib/motrix-next/sidecars/motrix-next-engine
        ln -sf ${aria2Next}/bin/aria2-next $out/bin/motrix-next-engine
        
        # 3. 针对 Tauri 2 Linux 平台特化：有些版本会寻找带系统架构后缀的 sidecar 名字
        ln -sf ${aria2Next}/bin/aria2-next $out/lib/motrix-next/sidecars/motrix-next-engine-x86_64-unknown-linux-gnu
        ln -sf ${aria2Next}/bin/aria2-next $out/bin/motrix-next-engine-x86_64-unknown-linux-gnu
      '';
    }))
  ];
}
