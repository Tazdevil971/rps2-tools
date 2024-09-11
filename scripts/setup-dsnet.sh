#!/bin/bash -e
# Utility to build and install dsnet
ROOT="${ROOT:-$PWD}"

PREFIX=$ROOT/prefix
DSNET_SRC=$ROOT/repos/dsnet

mkdir $DSNET_SRC/build
(cd $DSNET_SRC
    cmake \
        -B$DSNET_SRC/build \
        -GNinja)

cmake --build $DSNET_SRC/build

# Copy all of the executables
install $DSNET_SRC/build/dscomp $PREFIX/bin/
install $DSNET_SRC/build/dsdcons $PREFIX/bin/
install $DSNET_SRC/build/dsecons $PREFIX/bin/
install $DSNET_SRC/build/dsefilesv $PREFIX/bin/
install $DSNET_SRC/build/dselist $PREFIX/bin/
install $DSNET_SRC/build/dseping $PREFIX/bin/
install $DSNET_SRC/build/dsestart $PREFIX/bin/
install $DSNET_SRC/build/dsicons $PREFIX/bin/
install $DSNET_SRC/build/dsifilesv $PREFIX/bin/
install $DSNET_SRC/build/dsiping $PREFIX/bin/
install $DSNET_SRC/build/dsistart $PREFIX/bin/
install $DSNET_SRC/build/dskill $PREFIX/bin/
install $DSNET_SRC/build/dsmcons $PREFIX/bin/
install $DSNET_SRC/build/dsnetm $PREFIX/bin/
install $DSNET_SRC/build/dsreset $PREFIX/bin/
install $DSNET_SRC/build/dssim $PREFIX/bin/
install $DSNET_SRC/build/dsstat $PREFIX/bin/
install $DSNET_SRC/build/pacons $PREFIX/bin/

install $DSNET_SRC/build/dsedb $PREFIX/bin/_dsedb
install $DSNET_SRC/build/dsidb $PREFIX/bin/_dsidb

# Create wrappers over dsedb/dsidb that automatically include -nr
printf "#!/bin/sh\n_dsedb -nr \$@" > $PREFIX/bin/dsedb
printf "#!/bin/sh\n_dsidb -nr \$@" > $PREFIX/bin/dsidb

chmod +x $PREFIX/bin/dsedb
chmod +x $PREFIX/bin/dsidb