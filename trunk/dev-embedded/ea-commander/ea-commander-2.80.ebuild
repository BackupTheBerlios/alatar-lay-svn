# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="The energyAware Commander is a combined GUI and command line tool for flash programs to the EFM32 MCUs."
HOMEPAGE="http://www.energymicro.com/downloads/online-help-energyaware-commander"
SRC_URI="http://cdn.energymicro.com/dl/packages/energyAwareCommander_linux_pkg_${PV}.zip"

LICENSE="EnergyMicro"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
QA_PREBUILT="*"
EMUL_X86_VER=20120520
ABI="x86"
BINARY_NAME=eACommander

RDEPEND="
	>=dev-embedded/ea-libjlinkarm-4.69b
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
	mv -v ${BINARY_NAME} "${S}" || die
	cd "${S}"
	epatch "${FILESDIR}"/start-eACommander.sh.patch
}

src_install() {
	into /opt
	exeinto /opt/bin
	doexe ${BINARY_NAME}
	newexe start-eACommander.sh ${PN}

	dodoc README.txt README.linux Changelog

	make_desktop_entry ${PN} 'energyAware Commander'
#	newicon <icon_name>.png ${PN}.png
#	make_desktop_entry ${PN} 'energyAware Commander' ${PN}.png 'Development;Electronics'
}
