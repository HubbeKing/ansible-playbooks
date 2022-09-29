#!/bin/bash

dig @127.0.0.1 -p 53 pi.hole +timeout=1 || exit 1
if ip addr | grep -q 192.168.1.100; then
    dig @192.168.1.100 -p 53 pi.hole +timeout=1 || exit 1
fi
