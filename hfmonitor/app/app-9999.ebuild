# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="HFMonitor"
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/hcab14/HFMonitor.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-db/sqlite
dev-libs/boost[context,threads]
dev-libs/libusb:1.0
dev-libs/libpthread-stubs
sci-libs/fftw:3.0[threads]
x11-libs/fltk
hfmonitor/volk
media-libs/portaudio
sys-apps/lsb-release
sys-libs/ncurses
x11-libs/cairo
x11-libs/fltk
"

RDEPEND="${DEPEND}"

src_configure() {
    cmake-utils_src_configure
}

src_install() {
    cmake-utils_src_install
}

