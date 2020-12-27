# PacFree

> Making pacman free-software aware

![alt_tag](https://github.com/leo-arch/pacfree/blob/master/free_pacman.png)

I simply love `pacman`; but I think it falls short when it comes to free-software. It simply makes no distinction at all between free and non-free software; but it should. 

What I offer here is a simple `pacman` wrapper written in Bash and aimed to make `pacman` free-software aware by making use of Parabola's blacklist. The wrapper is very simple: every time the user attempts to install some package via the `-S` option, the wrapper will check the blacklist looking for the package. If found, that is, if the package is non-free, the user will be warned and asked whether or not she wants to continue. Next, if necessary, `pacman` will be called to do its thing.

This point is absolutely relevant: WARNING the user about proprietary software is one thing, and FORCING the user NOT to install
proprietary sofware, as Parabola does (via its `your-freedom` package), is a completely different thing. No one can be FORCED to be free; that's impossible. Freedom must be chosen, and there is no freedom without choices. It is the user herself, and not someone else, be it a person or a software, who must freely DECIDE not to install proprietary software. Someone who is forced to do the right thing would be a good robot, a good machine, but not a good person. This is where Parabola, and all the FSF endorsed distributions as well, is wrong; and this is why I wrote this wrapper: it will warn you about non-free software, but it's up to you what to do about it.

Even if you are concerned with free-software, just as I am, you don't need to move away from Arch: it is just too great to be left behind. Instead, you can help to make it even better, freer, and more powerful. This is the reason of this wrapper. Of course, it is far from perfect, but it's better than none.

## Using pacfree:

1. Clone this project:

       $ git clone https://github.com/leo-arch/pacfree

Navigate to the directory called `pacfree`; you will find here the PKGBUILD file: Just build it and install it:

       $ makepkg -si

A much better alternative is to copy this wrapper to `/usr/local/sbin` or `/usr/local/bin` and rename it to `pacman`. In doing this, insofar as `/usr/local/sbin` precedes `/usr/bin` in `$PATH`, whenever you call `pacman` from the command line, with or without `sudo`, the wrapper will be executed in place of `/usr/bin/pacman`, which in turn will be executed later by the wrapper itself. Another, and perhaps easier alternative, is to create an alias, making `pacman` point to `pacfree`.

## Pacfree, IsFree, and PacRep

I also added two simple functions to `pacman`: `-C --check`,  to make it able to scan the computer looking for non-free installed packages. However, if `isfree` (see https://github.com/leo-arch/isfree) is found, it will be used instead of this basic function.

![alt_tag](https://github.com/leo-arch/pacfree/blob/master/pacman-c.png)

The second added function is `-l --add-libre`, which automatically adds and enable the `[libre]` repository to pacman database.

Now, you can list the packages contained in the `[libre]` repo:

       $ pacman -Sl libre

and DECIDE whether you want to install some of these pacakges. I you so decide, let pacman know which repo contains the package you want to install. Why? Because some packages in the `[libre]` repository have the same name as its non-free version. For example, the free/libre version of midori is named in the `[libre]` repo -just like the non-free version- "midori".

       # pacman -S libre/midori

NOTE: According to Parabola's blacklist, `core/filesystem` is "non-free"; that's why Parabola offers a "free" version of it: `libre/filesystem`. However, the reason behind this is completely stupid: some files provided by `core/silesystem`, like `/usr/lib/os-release` and `/usr/share/factory/etc/issue`, contain the name "Arch Linux" instead of "Parabola". That's all: there's no free-software issue here, but just a trademarking issue. On the other side, `/usr/lib/os-release` is responsible for the welcome message you see at boot time. So, if you install `libre/filesystem`, "Welcome to Arch Linux" will be replaced by "Welcome to Parabola GNU/Linux libre" (in a horrible magenta color!).

This is why I removed this kind of blacklisted packages (that is, those based on trademarking and merely technical issues) from Parabola's blacklist, allowing thus only the `[nonfree]`, `[semifree]`, and `[uses-nonfree]` tags. 

However, there are still a few drawbacks with the above approach: 1) You need to explicitly tell pacman from which repository to install a package; 2) It does not work for upgrades: if you place the new repository, say `[libre]` at the bottom of the repositories list in `/etc/pacman.conf`, all packages provided both by `[libre]` and another repository placed on top of it, will always be installed by pacman from the first repository in the list providing that package, overriding thus our decision to install that package from `[libre]` or another non-offical repository.

To deal with these issues, I wrote a script called `pacrep`, which allows us to choose pacman repositories on a per package basis using rules defined in the configuration file (disregarding the repositories order in pacman configuration file). Just tell `pacrep` from which repository is a package to be installed/upgraded and it will always be installed/upgraded from that specific repository. For more information see https://github.com/leo-arch/pacrep.

Before installing any package, `pacfree` will look for `pacrep` and use it if found. If not, it will execute `pacman` as usual.

So, despite the fact that `isfree`, `pacfree`, and `pacrep` all work as standalone programs, they were designed to work together, as part of a bigger project: make pacman and Archlinux (without ceasing to be Archlinux), even more free.
