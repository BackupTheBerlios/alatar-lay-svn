# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
WX_GTK_VER="2.9"

inherit autotools flag-o-matic subversion wxwidgets

DESCRIPTION="wxPlotCtrl is a interactive xy data plotting widgets"
HOMEPAGE="http://wxcode.sourceforge.net/"
ESVN_REPO_URI="https://wxcode.svn.sourceforge.net/svnroot/wxcode/trunk/wxCode/components/${PN}"
SRC_URI=""

LICENSE="wxWidgets licence"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/wxGTK:2.9[X]
	x11-libs/wxthings"
RDEPEND="${DEPEND}"

src_unpack(){
	subversion_src_unpack
	cd "${S}"
	epatch "${FILESDIR}"/mouse_usabil.patch
}

src_configure() {
	append-flags -fPIC -DwxPLOTCTRL_FAST_GRAPHICS=0

    econf \
        --with-wx-config="${WX_CONFIG}"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

