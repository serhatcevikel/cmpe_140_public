#/bin/bash

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

    if (!require('data.table', character.only = T, quietly = T)) {
        install.packages('data.table')
    }
    
    if (!require('IRkernel', character.only = T, quietly = T)) {
        devtools::install_github('IRkernel/IRkernel')
        IRkernel::installspec(user = FALSE)
    }

q()
HERE
