# pacfree

> Make pacman free-software aware

![alt_tag](https://github.com/leo-arch/pacman-freedom/blob/master/free_pacman2.png)

I simply love Arch Linux' `pacman`; but I think it falls short when it comes to free-software. It simply makes no distinction at all between free and non-free software; but it should. 

What I offer here is a simple `pacman` wrapper written in Bash and aimed to make `pacman` free-software aware by making use of Parabola's blacklist. The wrapper is very simple: every time the user attempts to install some package via the `-S` option, the wrapper will check the blacklist looking for the package. If found, that is, if the package is non-free, the user will be warned and asked whether or not she wants to continue. Next, if necessary, `pacman` will be called to do its thing.

This point is absolutely relevant: WARNING the user about proprietary software is one thing, and FORCING the user NOT to install
proprietary sofware, as Parabola does (via its `your-freedom` package), is a completely different thing. No one can be FORCED to be free; that's impossible. Freedom must be chosen, and there is no freedom without choices. It is the user herself, and not someone else, be it a person or a software, who must freely DECIDE not to install proprietary software. Someone who is forced to do the right thing would be a good robot, a good machine, but not a good person. This is where Parabola, and all the FSF endorsed distributions as well, is wrong; and this is why I wrote this wrapper: it will warn you about non-free software, but it's up to you what to do about it.

Even if you are concerned with free-software, just as I am, you don't need to move away from Arch: it is just too great to be left behind. Instead, you can help to make it even better, freer, and more powerful. This is the reason of this wrapper. Of course, it is far from perfect, but it's better than none.

## Using pacfree:

1. Clone this proyect:

       $ git clone https://github.com/leo-arch/pacfree

Navigate to the directory called `pacfree`; you will find in there a file named `pacman`: that's the wrapper. Now, you can use this wrapper in two ways:

a. Copy it to some place in your `$HOME`, or wherever you want, name it as you please, and run it just as you run any local script or program. Example:

       ~ $ ./pacfree

b. A much better alternative is to copy this wrapper to `/usr/local/sbin` or `/usr/local/bin` and rename it to `pacman`. In doing this, insofar as `/usr/local/sbin` precedes `/usr/bin` in `$PATH`, whenever you call `pacman` from the command line, with or without `sudo`, the wrapper will be executed in place of `/usr/bin/pacman`, which in turn will be executed later by the wrapper itself.

I also added a simple function to `pacman` (-C | --check) to make it able to scan the computer looking for non-free official installed packages. This function depends on my `isfree` script (https://github.com/leo-arch/isfree)

![alt_tag](https://github.com/leo-arch/pacman-freedom/blob/master/pacman-c.png)

## Adding the [libre] repository

Though not necessary, you can take full advantage of this wrapper by adding Parabola's repository, called `libre`, to your
`pacman` database.

1. Go to `/etc/pacman.conf` and make this change:

`#RemoteFileSigLevel = Required` ----> `RemoteFileSigLevel = Never`

2. Download and install `parabola-keyring`:

       # pacman -U https://www.parabola.nu/packages/libre/any/parabola-keyring/download/

3. Revert the change made to `/etc/pacman.conf`

`RemoteFileSigLevel = Never` ----> `#RemoteFileSigLevel = Required`

4. Download a plain text file containing Parabola's mirrorlist from Parabola's official site: 

       # curl -o /etc/pacman.d/parabola_mirrorlist https://parabola.serverpit.com//mirrorlist.txt

or:

       # curl -o /etc/pacman.d/parabola_mirrorlist https://www.parabola.nu/mirrorlist/all/

5. Choose one of the mirrors provided by the downloaded mirrorlist file and add it to the end of `/etc/pacman.conf` as if it were just a custom repo named "libre".

```
[libre]
#SigLevel = Never
Server = http://mirror.fsf.org/parabola/$repo/os/$arch
```

6. Refresh `pacman` database:
       
       # pacman -Sy

7. List the packages contained in the `[libre]` repo:

       $ pacman -Sl libre

8. DECIDE whether you want to install some of these pacakges. I you so decide, let pacman know which repo contains the package you want to install. Why? Because some packages in the `[libre]` repo have the same name as its non-free version. For example, the free/libre version of midori is named in the `[libre]` repo -just like the non-free version- "midori".

       # pacman -S libre/midori

NOTE: According to Parabola's blacklist, `core/filesystem` is "non-free"; that's why Parabola offers a "free" version of it: `libre/filesystem`. However, the reason behind this is completely stupid: some files provided by `core/silesystem`, like `/usr/lib/os-release` and `/usr/share/factory/etc/issue`, contain the name "Arch Linux" instead of "Parabola". That's all: there's no free-software issue here, but just a trademarking issue. On the other side, `/usr/lib/os-release` is responsible for the welcome message you see at boot time. So, if you install `libre/filesystem`, "Welcome to Arch Linux" will be replaced by "Welcome to Parabola GNU/Linux libre" (in a horrible magenta color!).

So, simply check what you want to install from the `[libre]` repo before actually installing it. 
