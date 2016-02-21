# build a complete h2o service on linux

```sh
$ git clone https://github.com/reqshark/h2oconf
$ cd h2oconf
$ ./configure
$ make                # installs h2o in /usr/local/bin
$ sudo make install   # installs an init.d service for h2o

$ /etc/init.d/h2o start
```

to update your h2o installation do:
```sh
$ make h2o && sudo make install
```
