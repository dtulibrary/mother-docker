#!/bin/bash

# So anybody can clone the projects, we need to clone via HTTPS
# That means that git will ask you for your username and password every time you push a commit
# DTU employees don't need that since they can use their SSH keys
# Therefore they can run this (until we find a better solution)
sed -i 's/https:\/\/github.com\//git@github.com:/g' `find .git/modules -type f -name config`
