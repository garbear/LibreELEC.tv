# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="game.libretro.snes9x2002"
PKG_VERSION="7.2.0.35-Nexus"
PKG_SHA256="8decddce2d73a0c6e23cb121ee3d09b2d19eb587818734c563914148c1189af3"
PKG_REV="1"
# neon optimizations make it only useful for arm
PKG_ARCH="arm"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kodi-game/game.libretro.snes9x2002"
PKG_URL="https://github.com/kodi-game/game.libretro.snes9x2002/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform snes9x2002"
PKG_SECTION=""
PKG_LONGDESC="game.libretro.snes9x2002: snes9x2002 for Kodi"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="kodi.gameclient"
