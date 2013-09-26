# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MYSPELL_DICT=(
	"Russian-English.aff"
	"Russian-English.dic"
)

MYSPELL_HYPH=(
)

MYSPELL_THES=(
)

inherit myspell-r2

DESCRIPTION="Russian English mixed dictionaries for myspell/hunspell"
HOMEPAGE="http://ftp.mozilla-russia.org/dictionaries"
SRC_URI="http://ftp.mozilla-russia.org/dictionaries/ru-en_spell_dictionary.xpi"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""
RESTRICT="mirror"

src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	local f
	for f in ${A}; do
		case ${f} in
			*.xpi)
				echo ">>> Unpacking "${DISTDIR}/${f}" to ${PWD}"
				unzip -qoj ${DISTDIR}/${f}
				assert "failed unpacking ${DISTDIR}/${f}"
				;;
			*) unpack ${f} ;;
		esac
	done
}

