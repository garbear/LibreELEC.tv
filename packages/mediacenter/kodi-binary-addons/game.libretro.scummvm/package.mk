# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="game.libretro.scummvm"
PKG_VERSION="2.7.0.37-Nexus"
PKG_SHA256="da7b3b77478140c50741df331679f95bad14227d2faded98c223da85f148155b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kodi-game/game.libretro.scummvm"
PKG_URL="https://github.com/kodi-game/game.libretro.scummvm/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform libretro-scummvm"
PKG_SECTION=""
PKG_LONGDESC="game.libretro.scummvm: scummvm for Kodi"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="kodi.gameclient"

pre_configure_target() {
  export LDFLAGS=$(echo ${LDFLAGS} | sed -e "s|-Wl,--as-needed||")
}
