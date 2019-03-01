# Dockerfile for ThinkStats

FROM rocker/tidyverse
MAINTAINER Russ Poldrack <poldrack@gmail.com>

RUN sudo apt-get clean all
RUN sudo apt-get update
RUN sudo apt-get dist-upgrade -y
RUN sudo apt-get autoremove
RUN apt-get install -y make git ssh
RUN apt-get install  -y jags
RUN apt-get install -y gsl-bin libgsl-dev libv8-3.14.5
RUN apt-get install  -y libudunits2-0
RUN apt-get install -y texlive-full

# installing R packages

RUN echo 'install.packages(c( \
"emmeans", \
"kableExtra", \
"MASS", \
"ggplot2", \
"tidyr", \
"readr", \
"mapproj", \
"pander", \
"DiagrammeR", \
"caret", \
"BayesMed", \
"modelr", \
"lmerTest", \
"lme4", \
"pwr", \
"BayesFactor", \
"boot", \
"dplyr", \
"cowplot", \
"brms", \
"tidyverse", \
"reshape2", \
"NHANES", \
"fivethirtyeight", \
"sfsmisc", \
"bookdown"), \
  repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R && \
  Rscript /tmp/packages.R

# fiftystater was removed from CRAN so must be installed from the archive

RUN echo 'install.packages("https://cran.r-project.org/src/contrib/Archive/fiftystater/fiftystater_1.0.1.tar.gz",\
  repos=NULL,dependencies=TRUE)' > /tmp/packages2.R  && Rscript /tmp/packages2.R

CMD ["/bin/bash"]
