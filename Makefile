BUILD_DIRS=build.*

all: image

system:
	./scripts/image

release:
	./scripts/image release

image:
	PROJECT=Generic ARCH=x86_64 CUSTOM_VERSION=20211013-0c2ea139-retroplayer-19.2 ./scripts/image mkimage
	PROJECT=RPi ARCH=arm DEVICE=RPi2 CUSTOM_VERSION=20211013-0c2ea139-retroplayer-19.2 ./scripts/image mkimage
	PROJECT=RPi ARCH=arm DEVICE=RPi4 CUSTOM_VERSION=20211013-0c2ea139-retroplayer-19.2 ./scripts/image mkimage
	PROJECT=Rockchip ARCH=arm DEVICE=RK3399 CUSTOM_VERSION=20211013-0c2ea139-retroplayer-19.2 ./scripts/image mkimage

	( \
	  cd "./target" && \
	  rm -f *.kernel && \
	  rm -f *.ova && \
	  rm -f *.sha256 && \
	  rm -f *.system && \
	  rm -f *.tar \
	)

	rsync -aP --update --protect-args --delete \
	  "./target/" \
	  "/home/${USER}/Shared/libreelec/" \

noobs:
	./scripts/image noobs

clean:
	rm -rf $(BUILD_DIRS)/* $(BUILD_DIRS)/.stamps

distclean:
	rm -rf ./.ccache ./$(BUILD_DIRS)

src-pkg:
	tar cvJf sources.tar.xz sources
