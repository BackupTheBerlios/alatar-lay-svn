# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Simplicity Studio is a free software suite which you need to start developing your EFM32 application."
HOMEPAGE="http://www.energymicro.com/tools/simplicity-studio"
SRC_URI="https://energymicrofiles.s3.amazonaws.com/dl/packages/studiow_linux_pkg.zip"

LICENSE="EnergyMicro"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
QA_PREBUILT="*"
EMUL_X86_VER=20120520
ABI="x86"
BINARY_NAME=studiow
DIR_NAME=${BINARY_NAME}

RDEPEND="
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
	mv -v ${DIR_NAME} "${S}" || die
	cd "${S}"
	epatch "${FILESDIR}"/start-studio.sh.patch
}

src_install() {
	into /opt
	exeinto /opt/bin
	doexe ${BINARY_NAME}
	newexe start-studio.sh ${PN}
	dolib libquazip.so.1
	dodoc README.txt Changelog

	newicon simplycity_icon256x256.png ${PN}.png
	make_desktop_entry ${PN} 'Simplicity Studio'  ${PN}.png 'Development;Electronics'
}
