# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=pacfree
pkgver=0.4.8
pkgrel=1
pkgdesc="Make pacman free-software aware"
arch=(any)
url="https://github.com/leo-arch/pacfree"
license=(GPL2)
depends=('bash' 'pacman' 'coreutils' 'curl' 'grep' 'sed' 'util-linux' 'gawk')
optdepends=('isfree: Check your system for non-free software')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
