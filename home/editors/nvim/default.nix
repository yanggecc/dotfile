{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    # 为 neovim 提供运行时依赖（LSP、格式化、插件依赖）
    extraPackages = with pkgs; [
      # 基础工具
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
  };

  # 额外安装的编辑器相关软件
  home.packages = with pkgs; [
    neovide
    luajitPackages.luarocks_bootstrap
  ];
}