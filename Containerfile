FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt update && \
    apt install -y texlive-full lmodern libbz2-dev nano && \
    apt clean

RUN conda install -y -c conda-forge \
    r-dt \
    r-fivethirtyeight \
    r-kableextra \
    r-ggally \
    r-learnr \
    r-mosaic \
    r-mosaiccore \
    r-mosaicdata \
    r-network \
    r-palmerpenguins \
    r-skimr \ 
    r::r-cherryblossom \
    r::r-lock5data \
    r::r-openintro 
    
RUN R -e "install.packages(c('tutorial.helpers'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"
RUN R -e 'devtools::install_github("hadley/emo")'

USER $NB_USER



