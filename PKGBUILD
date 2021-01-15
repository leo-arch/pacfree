# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=pacfree
pkgver=0.5.9
pkgrel=1
pkgdesc="A pacman wrapper to make pacman free-software aware"
arch=(any)
url="https://github.com/leo-arch/pacfree"
license=(GPL2)
depends=('pacman' 'coreutils' 'grep' 'sed' 'util-linux' 'gawk')
optdepends=('isfree: Check your Arch system for nonfree software')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man8/${pkgname}.8"
  gzip "$pkgdir/usr/share/man/man8/${pkgname}.8"
}
