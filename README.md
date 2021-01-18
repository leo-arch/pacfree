# PacFree
> Making pacman free-software aware

### Packages

[![pacfree](https://img.shields.io/aur/version/pacfree?color=1793d1&label=pacfree&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/pacfree/)
[![License](https://img.shields.io/github/license/leo-arch/pacfree?color=333333&style=for-the-badge)](https://github.com/leo-arch/pacfree/blob/master/LICENSE)

## Description

![pacfree](https://github.com/leo-arch/pacfree/blob/master/screenshots/free_pacman.png)

**NOTE**: Since version 0.4.0, most of the code have been rewritten and merged with `pacrep` functionality.

I simply love `pacman`; but I think it falls short when it comes to free-software. It simply makes no distinction at all between free and non-free software; but it should. 

What I offer here is a simple `pacman` wrapper written in Bash and aimed to make `pacman` free-software aware by making use of Parabola's blacklists. The wrapper is very simple: every time the user attempts to install some package via the `--sync` (`-S`) option, the wrapper will check the blacklist looking for the package. If found, that is, if the package is non-free, the user will be warned and asked whether or not she wants to continue. Next, if necessary, `pacman` will be called to do its thing.

This point is absolutely relevant: WARNING the user about proprietary software is one thing, and FORCING the user NOT to install
proprietary sofware, as Parabola does (via its `your-freedom` package), is a completely different thing. No one can be FORCED to be free; that's impossible. Freedom must be chosen, and there is no freedom without choices. It is the user herself, and not someone else, be it a person or a software, who must freely DECIDE not to install proprietary software. Someone who is forced to do the right thing would be a good robot, a good machine, but not a good person. This is where Parabola, and all the FSF endorsed distributions as well, is wrong; and this is why I wrote this wrapper: it will warn you about non-free software, but it's up to you what to do about it.

Once `pacfree` knows what is to be installed/upgraded, it checks every package against a rules list (a series of lines in the form "repo/pkg" defined in a rules file: `$HOME/.config/pacfree/rules.conf`), and, if a rule for the package is found, it installs the package from the specified repository (instead of from the first repository defined in `/etc/pacman.conf` providing the package, which is pacman's default behaviour).

The main idea of this functionality is to make `pacman` able to handle packages with the same name in different repositories, for example, "core/licenses" and "libre/licenses", or "community/midori" and "libre/midori", without the need to explicitly specify the repository in the command line, besides the important fact that it works for upgrades as well. Just define in the rules file from which repository a certain package is to be installed/upgraded and `pacfree` will always install/upgrade the package from the specified repository (disregarding the repositories order in `/etc/pacman.conf`). In this way, we can use packages and repositories coming from different Arch based distributions more easily and smoothly.

If you are concerned with free-software, just as I am, you don't need to move away from Arch: it is just too great to be left behind. Instead, you can help to make it even better, more free, and more powerful. This is the reason of this wrapper. Of course, it is far from perfect, but it's better than none.

## Using pacfree

PacFree is available on the AUR (https://aur.archlinux.org/packages/isfree)

Or, if you prefer to install it manually:

Clone this project:

        $ git clone https://github.com/leo-arch/pacfree

Navigate to the directory called `pacfree`; you will find here the PKGBUILD file: Just build it, install it, and run it:

	$ makepkg -si
	$ pacfree -h

** NOTE **: To preserve the "pacman" name, you can create a symlink in `/usr/local/bin` called `pacman` pointing to `/usr/bin/pacfree`. In doing this, insofar as `/usr/local/bin` precedes `/usr/bin` in `$PATH`, whenever you call `pacman` from the command line, with or without `sudo`, `pacfree` will be executed instead of `/usr/bin/pacman`, which in turn will be executed later by the wrapper itself. Of course, if you want to run the original `pacman`, you still can do it specifying the complete path to pacman's binary: `/usr/bin/pacman`.

## PacFree and IsFree

I added two simple options to those originally provided by `pacman`: `-f --checkfree`,  to make it able to scan the computer looking for non-free installed packages (however, if `isfree` (see https://github.com/leo-arch/isfree) is found, it will be used instead of this basic function).

![checkfree](https://github.com/leo-arch/pacfree/blob/master/screenshots/pacfree-f.png)

The second added function is `-L --add-libre`, which lets you add and enable Parabola's free/libre repositories to pacman database.

**NOTE**: According to Parabola's blacklist, `core/filesystem` is "non-free"; that's why Parabola offers a "free" version of it: `libre/filesystem`. However, the reason behind this has nothing to do with `FOSS`: some files provided by `core/silesystem`, like `/usr/lib/os-release` and `/usr/share/factory/etc/issue`, contain the name "Arch Linux" instead of "Parabola". That's all: there's no free-software issue here, but just a trademarking issue. On the other side, `/usr/lib/os-release` is responsible for the welcome message you see at boot time. So, if you install `libre/filesystem`, "Welcome to Arch Linux" will be replaced by "Welcome to Parabola GNU/Linux libre".

This is why `pacfree` automatically removes this kind of blacklisted packages (that is, those based on trademarking and merely technical issues) from Parabola's blacklist, allowing thus only those marked as truly non-free, namely, those tagged as `[nonfree]`, `[semifree]`, and/or `[uses-nonfree]`.

If you find any bug, and you will, please let me know it.
