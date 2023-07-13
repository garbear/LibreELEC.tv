# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-dosbox-core"
PKG_VERSION="b7b24262c282c0caef2368c87323ff8c381b3102"
PKG_SHA256="83d8b06eebc67f85ff7505271330b1f1c8ef6c4233ef85d070b0789eab83c33d"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/realnc/dosbox-core"
PKG_URL="${PKG_SITE}.git"
PKG_GIT_CLONE_BRANCH="libretro"
PKG_DEPENDS_TARGET="toolchain SDL_net libvorbis flac libsndfile opusfile mpg123"
PKG_LONGDESC="A DOSBox core for use in RetroArch and other libretro frontends"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="dosbox_core_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"
PKG_LIBVAR="DOSBOX_CORE_LIB"

PKG_MAKE_OPTS_TARGET="-C libretro BUNDLED_SDL=0 BUNDLED_AUDIO_CODECS=0 BUNDLED_LIBSNDFILE=0"

if [ "${ARCH}" = "aarch64" ]; then
  PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=arm64"
elif [ "${ARCH}" = "arm" ]; then
  PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=arm"
elif [ "${ARCH}" = "x86_64" ]; then
  PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=x86_64"
elif [ "${ARCH}" = "i386" ]; then
  PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=x86"
fi

makeinstall_target() {
  mkdir -p ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}
  cp ${PKG_LIBPATH} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME}
  echo "set(${PKG_LIBVAR} ${SYSROOT_PREFIX}/usr/lib/${PKG_LIBNAME})" > ${SYSROOT_PREFIX}/usr/lib/cmake/${PKG_NAME}/${PKG_NAME}-config.cmake
}
