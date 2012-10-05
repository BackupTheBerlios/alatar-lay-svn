# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
WX_GTK_VER="2.9"

inherit autotools flag-o-matic subversion wxwidgets

DESCRIPTION="wxThings is a variety of data containers and controls"
HOMEPAGE="http://wxcode.sourceforge.net/"
ESVN_REPO_URI="https://wxcode.svn.sourceforge.net/svnroot/wxcode/trunk/wxCode/components/${PN}"
SRC_URI=""

LICENSE="wxWidgets licence"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/wxGTK:2.9[X]"
RDEPEND="${DEPEND}"

src_unpack(){
	subversion_src_unpack
	cd "${S}"
	epatch "${FILESDIR}"/filedlgg_29_fix.patch
}

src_configure() {
    append-flags -fPIC -D_WX_FILEDLGG_H_

    econf \
        --with-wx-config="${WX_CONFIG}"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

