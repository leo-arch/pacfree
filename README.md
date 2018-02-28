# Pacman-freedom

> Make pacman free-software aware

I simply love Arch Linux' `pacman`; but I think it falls short when it comes to free-software. It simply makes no distinction at all between free and non-free software; and it should. 

What I offer here is a simple `pacman` wrapper written in Bash and aimed to make `pacman` free-software aware by making use of Parabola's blacklist. The wrapper is very simple: every time the user attempts to install some package via the `-S` option, the wrapper will check the blacklist looking for the package. If found, that is, if the package is non-free, the user will be warned and asked -unlike Parabola itself who simply forces, prevents the user from installing the program- whether or not she wants to continue. Next, if necessary, `pacman` will be called to do its thing.

![alt_tag](https://github.com/leo-arch/pacman-freedom/blob/master/free_pacman.png)

## Using pacman-freedom:

1. Clone this proyect:

       $ git clone https://github.com/leo-arch/pacman-freedom

Navigate to directory called `pacman-freedom`; you will find there a file named `pacman`: that's the wrapper. Now, You can use this wrapper in two ways:
a. Copy it to some place in your `$HOME`, or whatever you want, name it as you please, and run it just as you run any local script or program. Example:

       ~ $ ./pacman_free

b. A much better alternative is to place this wrapper, without modifying its name, in `/usr/local/sbin` or `/usr/local/bin`. In doing this, insofar as `/usr/local/sbin` comes before `/usr/bin` in `$PATH`, whenever you call `pacman` from the command line the wrapper will be executed instead of `/usr/bin/pacman`, which in turn will be executed later by the wrapper itself.

I also added a simple function to `pacman` (-C | --check) to make it able to scan the computer looking for non-free, official installed packages.

![alt_tag](https://github.com/leo-arch/pacman-freedom/blob/master/pacman-c.png)

Of course, it's far from perfect, but it's better than nothing.

