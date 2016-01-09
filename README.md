#Walkthrough
This is a walkthrough for a package which auto-upgrades the packages.

#Files
- [Source file, upgrade script](find_upgrade.sh)
- [Source file, init script](upgrader)
- [Source makefile](Makefile)

#Steps
Place the package makefile in package/feeds/upgrader/, route the link in feeds.conf.default, update the feed details and install it.
```
$ mkdir package/feeds/packages/auto-upgrader
$ vi package/feeds/packages/auto-upgrader/Makefile
# Write your package Makefile
$ vi feeds.conf.default
# Add the line
src-link upgrader /path/to/src/of/upgrader
$ ./scripts/feeds update
$ ./scripts/feeds install -a -p upgrader
```

Enable the package in menconfig and make the package.
```
$ make menuconfig
$ sudo make -j5
```

After this, in the OpenWrt device, after installing, you will find a service in /etc/init.d/upgrade. This will run a script placed in /bin/.

##Things to ensure/debug
- The 20 second wait in the init script(upgrader) is to delay the updates till the br-lan network is set up. So, if you can't figure out whether it is working, use ```logger/logread``` and check if the download of packages is giving an error.
- Ensure that the start, stop, boot routines have a tab before them, and not in terms of spaces.
- If you want to debug the services, you could use the logging system, to log into the logging system, use ```logger```, and to read it, do a ```logread```.
