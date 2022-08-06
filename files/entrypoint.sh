#!/bin/bash
set -e
 
chown -Rh minecraft /data/
 
exec "$@"