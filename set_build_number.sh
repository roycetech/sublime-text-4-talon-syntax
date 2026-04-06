#!/bin/bash

# Will print the current build number by parsing the CHANGELOG.md. This script
# is used in the Makefile when building the project.

grep -E '^\* v\d+.*' CHANGELOGs.md \
    | sed -n '1p' \
    | awk -F" - " '{print $1}' \
    | cut -c 4-  # 4th character onwards.
