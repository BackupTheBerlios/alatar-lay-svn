# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Communication toolbox library"
HOMEPAGE="https://iftools.com/opensource/ctb.en.php"
SRC_URI="https://iftools.com/download/ctb/${PV}/${P}.tar.gz"

LICENSE="wxWidgets licence"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
    cd "${S}/build"
    emake || die "emake failed"
}

src_install() {
    cd "${S}/build"
	emake DESTDIR="${D}" install || die "Install failed"
}

