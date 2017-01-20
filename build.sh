#!/bin/sh
cd /gluon
make update
OPTIONS="BUILD_LOG=1 FORCE_UNSAFE_CONFIGURE=1 DEFAULT_GLUON_BRANCH=develop DEFAULT_GLUON_RELEASE=develop-2016.2.2-0 V=s"
CORES=$(lscpu|grep -e '^CPU(s):'|xargs|cut -d" " -f2)
  echo "Kompiliert wird auf $CORES Kernen"
for TARGET in ar71xx-generic ar71xx-nand mpc85xx-generic x86-64 x86-generic x86-xen_domu; do
  echo "################# $TARGET ###########################"
  make GLUON_TARGET=$TARGET $OPTIONS || break
  echo "############$TARGET fertig ##########################" 
done && echo "alle Targets wurden erfolgreich erstellt." || echo "Fehlschlag! Abbruch"
