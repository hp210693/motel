#!/bin/sh
cd /usr/src/app
dlv debug --headless --log -l 0.0.0.0:2345 --api-version=2