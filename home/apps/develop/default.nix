{pkgs, ...}: {
  home.packages = with pkgs; [
    # Python 运行时
    python3

    # ---- C/C++ 编译器 ----
    gcc
    clang

    # ---- 构建系统 ----
    cmake
    ninja
    gnumake
    pkg-config
    vcpkg

    # ---- Autotools ----
    autoconf
    automake
    libtool

    # ---- 调试与诊断 ----
    gdb
    lldb
    valgrind
    cppcheck
    clang-tools

    # ---- 构建辅助工具 ----
    ccache
    bear # compile_commands.json 生成
    patch
    gzip
    bzip2
    xz
    unzip
    gnutar
  ];

  # NixOS 上没有 /lib64/ld-linux-x86-64.so.2，强制 vcpkg 使用系统二进制，
  # 避免 vcpkg 下载的通用 Linux 预编译工具（cmake/ninja/git 等）报 stub-ld 错误。
  home.sessionVariables = {
    VCPKG_FORCE_SYSTEM_BINARIES = "1";
  };
}
