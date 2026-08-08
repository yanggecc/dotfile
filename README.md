# young dots

基于 [NixOS](https://nixos.org/) 的个人 dotfiles，使用 flakes 管理，桌面环境为 [Niri](https://github.com/YaLTeR/niri) + Waybar。

## 快速开始

```bash
# 生成硬件配置（仅首次）
sudo nixos-generate-config --dir hosts/thinkbook --force
rm hosts/thinkbook/configuration.nix

# 构建 / 切换系统
sudo nixos-rebuild switch --flake .#thinkbook

# 用户级配置
home-manager switch --flake .#young@thinkbook
```

## 目录结构

```
├── flake.nix        # 入口点，依赖管理
├── hosts/           # 主机配置（thinkbook）
├── system/          # 系统级模块
│   ├── core/        # 启动、用户、包
│   ├── chinese/     # 中文本地化、字体、输入法
│   ├── desktop/     # X11/GDM/GNOME
│   ├── network/     # 网络
│   ├── nix/         # Nix 自身配置
│   ├── programs/    # 系统程序
│   └── services/    # pipewire、printing、v2raya
├── home/            # Home Manager 用户配置
│   ├── apps/        # 应用（chrome）
│   ├── cli/         # 终端工具
│   └── desktop/     # 桌面（niri、waybar）
├── modules/         # 可复用 NixOS 模块
├── lib/             # 自定义函数
├── outputs/         # flake outputs
├── vars/            # 全局变量
└── assets/          # 壁纸
```

## 校验与格式化

```bash
nix flake check            # 校验配置
nix run .#formatter -- .   # alejandra 格式化
```

## 功能

- **窗口管理器**：Niri（Wayland）
- **输入法**：Fcitx5 + Rime（雾凇拼音）
- **浏览器**：Google Chrome、Firefox
- **终端**：Ghostty + Fish
- **状态栏**：Waybar