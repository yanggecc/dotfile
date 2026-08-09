{
  pkgs,
  lib,
  config,
  ...
}: let
  nvimConfigDir = "${config.home.homeDirectory}/.config/nvim";
in {
  # 安装裸 neovim（命令式管理，配置由 NvChad 提供）
  home.packages = with pkgs; [
    (neovim.override {
      viAlias = true;
      vimAlias = true;
    })
    neovide
    luajitPackages.luarocks_bootstrap

    # 为 nvim 提供运行时依赖（LSP、格式化工具，供 Mason / none-ls 使用）
    ripgrep
    fd
    git
    lazygit
    lua
    tree-sitter

    # LSP 服务器
    nil # Nix
    lua-language-server
    typescript-language-server
    vscode-langservers-extracted
    pyright # Python
    gopls # Go
    rust-analyzer # Rust
    clang-tools # C/C++
    marksman # Markdown
    yaml-language-server
    dockerfile-language-server-nodejs

    # 格式化工具
    alejandra # Nix
    stylua # Lua
    prettierd
    shfmt
    nixfmt
  ];

  # 自动获取 NvChad starter 配置（仅首次，若目录不存在或非 git 仓库）
  home.activation.cloneNvChad = lib.mkAfter ''
    # 清理旧的 home-manager 符号链接（programs.neovim 留下的）
    if [ -L "${nvimConfigDir}/init.lua" ]; then
      rm -f "${nvimConfigDir}/init.lua"
    fi

    if [ ! -d "${nvimConfigDir}/.git" ]; then
      mkdir -p "${nvimConfigDir}"
      if [ -z "$(ls -A "${nvimConfigDir}")" ]; then
        $DRY_RUN_CMD git clone --depth 1 https://github.com/NvChad/starter "${nvimConfigDir}"
        $DRY_RUN_CMD rm -rf "${nvimConfigDir}/.git"
      else
        echo "~/.config/nvim 已存在非空目录，跳过自动 clone（请手动处理）"
      fi
    else
      echo "~/.config/nvim 已是 git 仓库，跳过自动 clone"
    fi
  '';
}
