#!/bin/bash
set -e
 
chown -Rh minecraft /home/minecraft/
 
exec "$@"