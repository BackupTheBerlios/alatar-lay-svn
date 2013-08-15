# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils multilib

DESCRIPTION="Simplicity Studio is a free software suite which you need to start developing your EFM32 application."
HOMEPAGE="http://www.energymicro.com/tools/simplicity-studio"
SRC_URI="https://energymicrofiles.s3.amazonaws.com/dl/packages/studiow_linux_pkg.zip"

LICENSE="EnergyMicro"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
QA_PREBUILT="opt/.*"
EMUL_X86_VER=20120520
ABI="x86"
BINARY_NAME=studiow
DIR_NAME=${BINARY_NAME}
S_PREFIX="/opt/silabs"

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
	sed -e "s:_BASEDIR_:${S_PREFIX}:g" -e "s:_LIBDIR_:$(get_libdir):g" "${FILESDIR}"/start-studio.sh.patch > "${T}"/start-studio.sh.patch || die
	epatch "${T}"/start-studio.sh.patch
}

src_install() {
	into ${S_PREFIX}
	exeinto ${S_PREFIX}/bin
	doexe ${BINARY_NAME}
	newexe start-studio.sh ${PN}
	dolib libquazip.so.1
	dodoc README.txt Changelog

	dodir /opt/bin
	dosym ${S_PREFIX}/bin/${PN} /opt/bin/${PN} || die

	newicon simplycity_icon256x256.png ${PN}
	make_desktop_entry ${S_PREFIX}/bin/${PN} 'Simplicity Studio'  ${PN} 'Development;Electronics'
}
