#!/bin/sh
cd /gluon
make update
OPTIONS="DEFAULT_GLUON_BRANCH=develop DEFAULT_GLUON_RELEASE=develop-2016.2.3-0 V=s"
CORES=$(lscpu|grep -e '^CPU(s):'|xargs|cut -d" " -f2)
  echo "Kompiliert wird auf $CORES Kernen"
for TARGET in ar71xx-generic ar71xx-nand mpc85xx-generic x86-64 x86-generic x86-kvm_guest x86-xen_domu; do
  echo "################# $TARGET ###########################"
  make GLUON_TARGET=$TARGET $OPTIONS || break
  echo "############$TARGET fertig ##########################" 
done && echo "alle Targets wurden erfolgreich erstellt." || echo "Fehlschlag! Abbruch"
