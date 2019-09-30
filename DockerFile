FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y tzdata software-properties-common && apt-add-repository universe && apt-get update
RUN apt-get install -y libxml2-dev libpng-dev libssl-dev libcurl4-openssl-dev python r-base python-pip 

RUN pip install snaptools
RUN Rscript -e 'install.packages(c("xml2","roxygen2","rversions","devtools"));'
RUN Rscript -e 'install.packages(c("doSNOW","Matrix"));'
RUN Rscript -e 'install.packages(("plot3D"));'
RUN Rscript -e 'devtools::install_github("r3fang/SnapATAC")'
