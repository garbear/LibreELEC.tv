PKG_NAME="gambatte"
PKG_DEPENDS_TARGET="libretro-gambatte"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_ORIG_SYSROOT_PREFIX}/usr/lib/gambatte_libretro.so ${INSTALL}/usr/lib/libretro/
}