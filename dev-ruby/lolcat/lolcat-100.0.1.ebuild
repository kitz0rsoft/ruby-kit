# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="lolcat.gemspec"

inherit ruby-fakegem

DESCRIPTION="Rainbows and unicorns!"
HOMEPAGE="https://github.com/busyloop/lolcat"

KEYWORDS="*"
LICENSE="BSD"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/optimist:3
	>=dev-ruby/paint-2.1:0"

all_ruby_prepare() {
	sed -e '/manpages/ s:^:#:' \
		-e 's/git ls-files --/echo/' \
		-e 's/git ls-files/find/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}

all_ruby_install() {
	doman man/lolcat.6
	ruby_fakegem_binwrapper lolcat
}