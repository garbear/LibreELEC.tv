# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-beetle-pcfx"
PKG_VERSION="724bd21b4524f8cf376dbc29c3e5a12cb674c758"
PKG_SHA256="0a0c373ebde6e741355c98e80da7629c7a58eaa51728d893edd6f5e93542ecbe"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-pcfx-libretro"
PKG_URL="https://github.com/libretro/beetle-pcfx-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="libretro implementation of Mednafen PC-FX."
PKG_TOOLCHAIN="make"

if [ "${ARCH}" = "i386" -o "${ARCH}" = "x86_64" ]; then
  PKG_MAKE_OPTS_TARGET="platform=unix"
else
  PKG_MAKE_OPTS_TARGET="platform=armv"
fi

pre_make_target() {
  PKG_MAKE_OPTS_TARGET+=" CC=${CC} CXX=${CXX} AR=${AR}"
}

PKG_LIBNAME="mednafen_pcfx_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="BEETLE-PCFX_LIB"

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
