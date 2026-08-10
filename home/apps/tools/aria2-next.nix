# aria2-next.nix
# 1. 在大括号中加入 pkg-config
{ lib, stdenv, fetchFromGitHub, cmake, ninja, pkg-config, openssl, c-ares, sqlite, zlib, ... }:

stdenv.mkDerivation rec {
  pname = "aria2-next";
  version = "2.5.5";

  src = fetchFromGitHub {
    owner = "AnInsomniacy";
    repo = "aria2-next";
    rev = "v${version}";
    hash = "sha256-+fJ+kl8FaZXmQJN/ozPzjuGejBIrvvXFC0GSxzTW2Q8="; 
  };

  # 2. 在这里加入 pkg-config
  nativeBuildInputs = [ cmake ninja pkg-config ];
  buildInputs = [ openssl c-ares sqlite zlib ];

  cmakeFlags = [
    "-DARIA2_STATIC_DEPENDENCIES=OFF"
    "-DARIA2_RELEASE_SIZE_OPTIMIZED=ON"
  ];

  meta = with lib; {
    description = "Maintained aria2 fork with native ED2K support and modern architecture";
    homepage = "https://github.com";
    license = licenses.gpl2Plus;
    platforms = platforms.unix;
  };
}
