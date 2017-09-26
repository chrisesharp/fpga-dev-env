#!/bin/sh

if [ -e /usr/local/diamond/3.9_x64/sp/cp_pack ]
then
    /usr/local/diamond/3.9_x64/sp/cp_pack 3.9 "" /usr/local
    rm -r -f /usr/local/diamond/3.9_x64/sp
fi
export temp=`rpm -ql diamond_3_9-base_x64 | head -1`
export dir=`basename $temp`
while [ $dir != "diamond" ]
do
    export dir=$temp
    export temp=`dirname $dir`
    export dir=`basename $temp`
done
export TARGET=`dirname $temp`
if [ $TARGET != /usr/local ]
then
    rm -r -f /usr/local/diamond/3.9_x64/bin
    rm -r -f /usr/local/diamond/3.9_x64/cae_library
    rm -r -f /usr/local/diamond/3.9_x64/data
    rm -r -f /usr/local/diamond/3.9_x64/docs
    rm -r -f /usr/local/diamond/3.9_x64/embedded_source
    rm -r -f /usr/local/diamond/3.9_x64/examples
    rm -r -f /usr/local/diamond/3.9_x64/ispfpga
    rm -r -f /usr/local/diamond/3.9_x64/module
    rm -r -f /usr/local/diamond/3.9_x64/synpbase
    rm -r -f /usr/local/diamond/3.9_x64/tcltk
    if [ -d /usr/local/diamond/3.9_x64 ]
    then
        rmdir --ignore-fail-on-non-empty /usr/local/diamond/3.9_x64
    fi
fi
if [ -e ${TARGET}/diamond/3.9_x64/sp/cp_pack ]
then
    ${TARGET}/diamond/3.9_x64/sp/cp_pack 3.9 "" ${TARGET}
    rm -r -f ${TARGET}/diamond/3.9_x64/sp
fi
