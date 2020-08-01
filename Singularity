#-*- mode: rpm-spec; fill-column: 79 -*-
Bootstrap: debootstrap
OSVersion: xenial
MirrorURL: http://archive.ubuntu.com/ubuntu/

%help
lidR R package for Airborne LiDAR Data Manipulation and Visualization for
Forestry Applications.

%labels
maintainer Pariksheet Nanda <hpc@uconn.edu>
url https://github.com/UConn-HPC/singularity-lidR

%environment
export LC_ALL=C

%post
# Install R and lidR dependencies.
sed -i 's/main/main universe/' /etc/apt/sources.list
apt-get -y update
apt-get -y install software-properties-common
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
add-apt-repository "deb http://cloud.r-project.org/bin/linux/ubuntu xenial-cran40/"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
apt-get -y update
apt-get -y install r-base-dev libgdal-dev libgeos++-dev libudunits2-dev libproj-dev libx11-dev libgl1-mesa-dev libglu1-mesa-dev libfreetype6-dev libv8-3.14-dev libxt-dev
apt-get -y clean
apt-get -y autoclean
# Install R packages.
Rscript -e "install.packages('lidR', repos = 'https://cloud.r-project.org', Ncpus = `nproc`)"

%test
exec Rscript -e "library(lidR)"

%runscript
exec R
