# h2o w/ init.d service on linux
the defualt conf in [/etc/h2o/h2o.conf](h2o.yml) listens for all hosts on port
80, so make sure to disable any other port 80 services, like nginx or apache.

# install h2o with the init.d service
```sh
$ git clone https://github.com/reqshark/h2oconf && cd h2oconf
$ ./configure
$ make                # installs h2o in /usr/local/bin
$ sudo make install   # installs an init.d service for h2o

$ sudo service h2o start && sudo service h2o status
$ sudo service h2o stop
```
