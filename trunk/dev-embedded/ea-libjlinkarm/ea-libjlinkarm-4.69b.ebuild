# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="The energyAware Profiler is a GUI tool profiling of energy consumption of the EFM32 MCUs."
HOMEPAGE="http://www.energymicro.com/downloads/online-help-energyaware-profiler"
SRC_URI="https://energymicrofiles.s3.amazonaws.com/dl/packages/energyAwareProfiler_linux_pkg_1.11.zip"

LICENSE="Segger"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
QA_PREBUILT="*"
EMUL_X86_VER=20120520
ABI="x86"
PACKAGE_NAME=profiler

RDEPEND=""

src_unpack() {
	unpack ${A}
	mv -v ${PACKAGE_NAME} "${S}" || die
}

src_install() {
	into /opt
	dolib libjlinkarm.so.4
	insinto /usr/share/${PN}
	doins 45-jlink.rules 45-jlink-NEW.rules
}

pkg_postinst() {
	elog
	elog "You need to be able to access the USB device as a standard user. On"
	elog "systems using udev, you can use the \"45-jlink.rules\" file found"
	elog "in the /usr/share/${PN} directory."
	elog "For later versions of udev, use \"45-jlink-NEW.rules\" instead"
	elog "	# cp /usr/share/${PN}/45-jlink.rules /etc/udev/rules.d/"
}
