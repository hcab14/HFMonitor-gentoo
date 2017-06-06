# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="HFMonitor"
HOMEPAGE="https://github.com/hcab14/HFMonitor"
EGIT_REPO_URI="https://github.com/hcab14/HFMonitor.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
>=dev-db/sqlite-3.17
>=dev-libs/boost-1.62[context,threads]
>=dev-libs/libusb-1.0
>=dev-libs/libpthread-stubs-0
>=sci-libs/fftw-3.3[threads]
>=x11-libs/fltk-1.3
  hfmonitor/volk
>=media-libs/portaudio-19
  sys-apps/lsb-release
>=x11-libs/cairo-1.14
>=x11-libs/fltk-1.3
"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=( -DCMAKE_SKIP_BUILD_RPATH=ON )
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	exeinto /usr/local/bin
	find ${BUILD_DIR}/src/ -executable -type f -exec doexe '{}' \;
}

