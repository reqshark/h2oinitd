.PHONY: install h2o

# check for basic deps
HAVE_GIT := $(shell which git)
HAVE_CURL := $(shell which curl)
HAVE_WGET := $(shell which wget)
HAVE_PKGCONFIG := $(shell which pkg-config)
HAVE_AUTOMAKE := $(shell which automake)
HAVE_AUTOCONF := $(shell which autoconf)
HAVE_GAWK := $(shell which gawk)
HAVE_CMAKE := $(shell which cmake)
HAVE_H2O := $(shell which h2o)

ifndef HAVE_GIT
$(error git is missing)
endif
ifndef HAVE_CURL
$(error curl is missing)
endif
ifndef HAVE_WGET
$(error wget is missing)
endif
ifndef HAVE_PKGCONFIG
$(error pkgconfig is missing)
endif
ifndef HAVE_AUTOMAKE
$(error automake is missing)
endif
ifndef HAVE_AUTOCONF
$(error autoconf is missing)
endif
ifndef HAVE_GAWK
$(error gawk is missing)
endif
ifndef HAVE_CMAKE
$(error cmake is missing)
endif

eq = $(and $(findstring $(1),$(2)),$(findstring $(2),$(1)))

ALL:
	$(if $(HAVE_H2O), @echo h2o installed. sudo make install, $(shell ./setup.sh))

install:
	$(if $(call eq, $(shell whoami), root), @echo installing, \
	$(error install as root. perhaps try sudo make install))
	if [ -f "/etc/init.d/h2o" ];then /etc/init.d/h2o stop && rm /etc/init.d/h2o;fi
	if [ -d "/etc/h2o" ]; then rm -f /etc/h2o/h2o.conf; else mkdir /etc/h2o; fi
	if [ ! -d "/srv" ]; then mkdir /srv; fi
	if [ ! -d "/srv/h2o" ]; then mkdir /srv/h2o; fi
	if [ -f "/srv/h2o/index.html" ]; then rm /srv/h2o/index.html; fi
	if [ ! -d "/var/log" ]; then mkdir /var/log; fi
	cp srv/h2o/index.html /srv/h2o/index.html
	cp etc/h2o/h2o.conf /etc/h2o/h2o.conf
	cp etc/init.d/h2o /etc/init.d/h2o
	chmod a+x /etc/init.d/h2o
	update-rc.d h2o defaults
	@echo init.d service installed

h2o:
	./setup.sh
