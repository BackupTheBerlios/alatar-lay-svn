# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic subversion cmake-utils

DESCRIPTION="Open source cross platform flash program for the STM factory preprogrammed bootloader"
HOMEPAGE="http://developer.berlios.de/projects/stmflasher/"
ESVN_REPO_URI="svn://svn.berlios.de/${PN}/trunk"
SRC_URI=""
#CMAKE_USE_DIR="${S}/build"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack(){
	subversion_src_unpack
}

#src_install() {
#	insinto /usr
#	dosbin stmflasher
#}

