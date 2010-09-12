#!/bin/sh

# Accesses Google's Closure Compiler and output the minified
# file to a ${FILE_NAME}.min.js
# ---
# Just use: ./JSCompiler ${js_file}

# js_code = ${code}
# compilation_level = SIMPLE_OPTIMIZATIONS
# output_info = complied_code
# output_format = text

INPUT=$1
TEMP=`echo $INPUT | sed 's/.js/''/'`
OUTPUT=$TEMP".min.js"
OPTIONS="compilation_level=SIMPLE_OPTIMIZATIONS&output_info=compiled_code&output_format=text"

CURL=curl
CLOSURE="closure-compiler.appspot.com/compile"

cat $INPUT > data
$CURL --data-urlencode js_code@data -d $OPTIONS $CLOSURE > $OUTPUT

rm -rf data