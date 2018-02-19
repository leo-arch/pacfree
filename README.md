I simply love Arch Linux' pacman; but I think it falls short when it comes to free-software. It simply makes no distinction at all
between free and non-free software; and it should. 

What I offer here is a simple pacman wrapper written in bash and aimed to make pacman free-software aware making use of Parabola's
blacklist. The wrapper is very simple: every time the user attempts to install some package via the -S option, the wrapper
will check the blacklist looking for the package. If found, that is, if the package is non-free, the user will be warned and asked -unlike Parabola itself who simply forces, prevents the user from installing the program- whether or not she wants to continue. Next, if necessary, pacman will be called to do its thing.

You can use this wrapper in two ways:
a) Copy it to some place in your $HOME, or whatever you want, name it as you please, and run it just as you run any local script or program.
b) A much better alternative is to place this wrapper, without modifying its name, in /usr/local/sbin. In doing this, insofar as /usr/local/sbin comes before /usr/bin in $PATH, whenever you call 'pacman' from the command line the wrapper will be executed instead of /usr/bin/pacman, which in turn will be executed later by the wrapper itself.

I added a simple function to pacman (-c | --check) to make it able to scan the computer looking for non-free, official installed
packages.

Of course, it's far from perfect, but it is at least something.
