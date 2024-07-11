# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-mrboom"
PKG_VERSION="effc579cac6f1f53f680a8f9b0bb9028e1401de8"
PKG_SHA256="c30c157a9c05c1375334b8f8081cef52a06c8899ce8c8d99a54f28cf168d3d74"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/mrboom-libretro"
PKG_URL="https://github.com/kodi-game/mrboom-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Mr.Boom is a 8 players Bomberman clone for RetroArch/Libretro"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mrboom_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="MRBOOM_LIB"

PKG_MAKE_OPTS_TARGET=""

if target_has_feature neon; then
  PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
fi

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
