.PHONY: preinst h2o

# check for basic deps
HAVE_GIT := $(shell which git)
HAVE_CURL := $(shell which curl)
HAVE_WGET := $(shell which wget)
HAVE_PKGCONFIG := $(shell which pkg-config)
HAVE_AUTOMAKE := $(shell which automake)
HAVE_AUTOCONF := $(shell which autoconf)
HAVE_GAWK := $(shell which gawk)
HAVE_CMAKE := $(shell which cmake)

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

ALL: preinst
	echo "made"

preinst:
	sudo ./setup.sh

h2o:
	sudo ./setup.sh
