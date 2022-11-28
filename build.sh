#!/bin/sh

zip -r -o -X -ll core_update.zip ./ -x '.git/*' -x 'build.sh' -x '.github/*' -x 'update.json'
