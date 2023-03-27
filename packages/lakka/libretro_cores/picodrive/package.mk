PKG_NAME="picodrive"
PKG_DEPENDS_TARGET="libretro-picodrive"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_ORIG_SYSROOT_PREFIX}/usr/lib/picodrive_libretro.so ${INSTALL}/usr/lib/libretro/
}
