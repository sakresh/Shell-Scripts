#!/bin/sh

FILE=$(basename $1)
DIR=$(dirname $1)
FILENAME="${FILE%.*}"
EXTENSION="${FILE##*.}"
OUTPUT=$FILENAME'_'$EXTENSION

makecpp(){
    mkdir -p $DIR/output
    g++ -o $OUTPUT $DIR/$FILE
    mv $OUTPUT $DIR/output/
    cd $DIR/output/
    ./$OUTPUT
 }

makerust(){
    mkdir -p $DIR/output
    rustc $DIR/$FILE
    mv $FILENAME $DIR/output/
    cd $DIR/output/
    ./$FILENAME
 }


makec(){
    mkdir -p $DIR/output
    g++ -o $OUTPUT $DIR/$FILE
    mv $OUTPUT $DIR/output/
    cd $DIR/output/
    ./$OUTPUT
 }

 makejava(){
    OP=$FILENAME".class"
    mkdir -p $DIR/output
    javac $FILE
    mv $OP $DIR/output/
    cd $DIR/output/
    java $FILENAME

 }

case "$EXTENSION" in
   "cpp") makecpp
      ;;
   "c") makec
      ;;
   "java") makejava
      ;;
   "rs") makerust
      ;;
esac
