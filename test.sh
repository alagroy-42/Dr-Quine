#!/bin/bash

SRCDIR=../srcs

cd ./c/
./Colleen > Colleen.diff ; diff $SRCDIR/Colleen.c Colleen.diff
./Grace; diff $SRCDIR/Grace.c Grace_kid.c
./Sully ; diff Sully_0.c $SRCDIR/Sully.c
cd ../asm
./Colleen > Colleen.diff ; diff $SRCDIR/Colleen.s Colleen.diff
./Grace; diff $SRCDIR/Grace.s Grace_kid.s
./Sully ; diff Sully_0.s $SRCDIR/Sully.s
cd ../php
php Colleen.php > Colleen.diff ; diff Colleen.php Colleen.diff
php Grace.php ; diff Grace.php Grace_kid.php
php Sully.php ; diff Sully_0.php Sully.php
exit 0