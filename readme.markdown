# h2o init.d service on linux
a generic conf in [/etc/h2o/h2o.conf](h2o.yml) listens for hosts on port 80

# install h2o and the init.d service
```sh
$ git clone https://github.com/reqshark/h2oconf && cd h2oconf
$ ./configure
$ make                # installs h2o in /usr/local/bin
$ sudo make install   # installs an init.d service for h2o

$ sudo service h2o start && sudo service h2o status
$ sudo service h2o stop
```
