#/bin/bash

# install pip, jupyter and R kernel on ubuntu
# install the kernel globally (not for a user)
# make the script executable by chmod +x jupyter_install.sh
# and run as sudo ./jupyter_install.sh

# Serhat Cevikel


# update/upgrade
apt-get update
apt-get -y upgrade

apt-get install -y python-dev python-pip r-base r-base-dev

## install jupyter notebook
pip install --upgrade pip
pip install jupyter

## install R kernel for jupyter
R --vanilla <<HERE
    mirid <- match("tr", getCRANmirrors()[,8])
    chooseCRANmirror(graphics=FALSE, ind=mirid)
    if (!require('devtools', character.only = T, quietly = T)) {
        install.packages('devtools')
    }

    if (!require('IRkernel', character.only = T, quietly = T)) {
        devtools::install_github('IRkernel/IRkernel')
        IRkernel::installspec(user = FALSE)
    }

q()
HERE
