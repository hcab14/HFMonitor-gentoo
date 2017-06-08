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
KEYWORDS="amd64 x86"
IUSE="gpu"

DEPEND="
app-editors/vim
>=dev-db/sqlite-3.17
>=dev-libs/boost-1.62[context,python,threads]
>=dev-libs/libusb-1.0
>=dev-libs/libpthread-stubs-0
dev-vcs/git
dev-lang/python
dev-python/setuptools
>=media-libs/portaudio-19
>=sci-libs/fftw-3.3[threads]
sci-libs/volk[orc]
sys-apps/lsb-release
>=x11-libs/fltk-1.3
>=x11-libs/cairo-1.14
>=dev-util/cmake-3.6[ncurses]
gpu? ( >=sci-libs/clfft-2.12.2 )
"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_SKIP_BUILD_RPATH=ON
		-DUSE_OPENCL="$(usex gpu)"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	exeinto /usr/local/bin
	find ${BUILD_DIR}/src/ -executable -type f -exec doexe '{}' \;
}
