PREFIX?=$(shell dirname `dirname \`which luvit\``)
BINDIR?=${PREFIX}/bin
MODULEDIR=${PREFIX}/lib/luvit/modules
# verbose build
export Q=
MAKEFLAGS+=-e

install:
	mkdir -p ${BINDIR}
	mkdir -p ${MODULEDIR}/heart
	echo "#!/usr/bin/env luvit" > ${BINDIR}/heart
	echo "require('../lib/luvit/modules/heart/heart.lua')" >> ${BINDIR}/heart
	chmod +x ${BINDIR}/heart
	cp *.lua ${MODULEDIR}/heart/
