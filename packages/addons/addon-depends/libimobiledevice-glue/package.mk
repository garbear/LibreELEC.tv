# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libimobiledevice-glue"
PKG_VERSION="1.1.0"
PKG_SHA256="e7f93c1e6ceacf617ed78bdca92749d15a9dac72443ccb62eb59e4d606d87737"
PKG_LICENSE="LGPL-2.1"
PKG_SITE="http://www.libimobiledevice.org"
PKG_URL="https://github.com/libimobiledevice/libimobiledevice-glue/releases/download/${PKG_VERSION}/libimobiledevice-glue-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libplist"
PKG_LONGDESC="A library with common code used by libraries and tools around the libimobiledevice project"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --disable-largefile"

post_configure_target() {
  libtool_remove_rpath libtool
}

post_makeinstall_target() {
  mkdir -p "${SYSROOT_PREFIX}/usr/include/lib/libimobiledevice-glue"
    cp ${PKG_BUILD}/include/libimobiledevice-glue/utils.h "${SYSROOT_PREFIX}/usr/include/libimobiledevice-glue"
}
