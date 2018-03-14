#!/bin/bash

if [ -d "/root/libphutil" ]; then
      cd /root/libphutil || exit 1
      git checkout "${libhash:-master}" > /dev/null 2>&1
fi

if [ -d "/root/arcanist" ]; then
      cd /root/arcanist || exit 1
      git checkout "${archash:-master}" > /dev/null 2>&1
fi
cd /root || exit 1
exec /bin/bash
