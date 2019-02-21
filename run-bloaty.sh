#!/bin/sh


tmpfile=$(mktemp /tmp/bloaty.XXXXXX)
cat > ${tmpfile}
/usr/local/bin/bloaty $@ ${tmpfile}
rm ${tmpfile}

