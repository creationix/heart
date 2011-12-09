PREFIX?=/usr/local
BINDIR?=${PREFIX}/bin
MODULEDIR=${PREFIX}/lib/luvit/modules
# verbose build
export Q=
MAKEFLAGS+=-e

install:
	mkdir -p ${BINDIR}
	mkdir -p ${MODULEDIR}/heart
	echo "#!${BINDIR}/luvit\nrequire('../lib/luvit/modules/heart/heart.lua')\n" > ${BINDIR}/heart
	chmod +x ${BINDIR}/heart
	cp *.lua ${MODULEDIR}/heart/
