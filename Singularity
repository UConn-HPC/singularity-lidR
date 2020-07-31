#-*- mode: rpm-spec; fill-column: 79 -*-
Bootstrap: debootstrap
OSVersion: bionic
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
# Install R.
apt-get -y update
apt-get -y install gnupg
echo "deb http://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/" > /etc/apt/sources.list.d/r.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sed -i 's/main/main universe/' /etc/apt/sources.list
apt-get -y update
apt-get -y install r-base-dev
# Install lidR package dependencies.
apt-get -y install libgdal-dev libproj-dev libgeos++-dev libudunits2-dev libproj-dev libx11-dev libgl1-mesa-dev libglu-dev libfreetype6-dev libv8-3.14-dev libxt-dev gdal-bin libfftw3-dev
apt-get -y remove gnupg
apt-get -y clean
apt-get -y autoclean
# Install R packages.
Rscript -e "install.packages('lidR', repos = 'https://cloud.r-project.org', Ncpus = `nproc`)"

%test
exec Rscript -e "library(lidR)"

%runscript
exec R
