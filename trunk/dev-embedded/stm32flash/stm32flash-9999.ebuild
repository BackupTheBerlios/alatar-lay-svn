# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic git-2

DESCRIPTION="Open source cross platform flash program for the STM32 bootloader"
HOMEPAGE="http://code.google.com/p/stm32flash/"
EGIT_REPO_URI="git://gitorious.org/${PN}/${PN}.git"
EGIT_BRANCH="merging"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack(){
	git-2_src_unpack
}

src_install() {
	insinto /usr
	dosbin stm32flash
}

