# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="The energyAware Designer is a GUI tool for pin planning and project generation for EFM32 MCUs."
HOMEPAGE="http://www.energymicro.com/"
SRC_URI="https://energymicrofiles.s3.amazonaws.com/dl/packages/energyAwareDesigner_linux_pkg_${PV}.zip"

LICENSE="EnergyMicro"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
QA_PREBUILT="*"
EMUL_X86_VER=20120520
ABI="x86"
BINARY_NAME=eADesigner
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
	epatch "${FILESDIR}"/start-eADesigner.sh.patch
}

src_install() {
	into /opt
	exeinto /opt/bin
	doexe ${BINARY_NAME}
	newexe start-eADesigner.sh ${PN}

#	dolib libboost_serialization.so.1.46.0
	dolib libCbc.so.3
	dolib libCbcSolver.so.3
	dolib libCgl.so.1
	dolib libClp.so.1
	dolib libCoinUtils.so.3
	dolib libOsiClp.so.1
	dolib libOsi.so.1
	dolib libprotobuf.so.6
	dodoc README.txt Changelog

	make_desktop_entry ${PN} 'energyAware Designer'
#	newicon designer256.png ${PN}.png
#	make_desktop_entry ${PN} 'energyAware Designer' ${PN}.png 'Development;Electronics'
}
