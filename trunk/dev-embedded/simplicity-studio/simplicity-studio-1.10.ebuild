# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Simplicity Studio is a free software suite which you need to start developing your EFM32 application."
HOMEPAGE="http://www.energymicro.com/tools/simplicity-studio"
SRC_URI="http://cdn.energymicro.com/dl/packages/studio_linux.tar.gz"

LICENSE="EnergyMicro"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
EMUL_X86_VER=20120520

RDEPEND="
	dev-lang/python
	>=sys-libs/readline-5.2
	dev-libs/libusb
	amd64? (
		>=app-emulation/emul-linux-x86-baselibs-${EMUL_X86_VER}
		>=app-emulation/emul-linux-x86-qtlibs-${EMUL_X86_VER}
		>=app-emulation/emul-linux-x86-xlibs-${EMUL_X86_VER}
	)
	!amd64? (
		x11-libs/libX11
		x11-libs/libXext
		x11-libs/libXScrnSaver
		x11-libs/libXv
		dev-qt/qtcore:4
		dev-qt/qtgui:4
	)"

src_unpack() {
	unpack ${A}
	mv -v energymicro "${S}" || die
}

src_install() {
	into /opt
	exeinto /opt/bin
	newexe studio.py ${PN}.py

	make_desktop_entry ${PN}.py 'Simplicity Studio'
#	newicon <icon_name>.png ${PN}.png
#	make_desktop_entry ${PN}.py 'Simplicity Studio'  ${PN}.png 'Development;Electronics'
}
