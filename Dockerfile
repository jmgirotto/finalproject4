FROM rocker/tidyverse:4.5.1 AS base

RUN apt-get update && apt-get install -y curl

RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project

#creating the renv folder in the working directory
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#default renv cache loccation to be in directory
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

#installing my packages
ENV RENV_CONFIG_INSTALL_STAGED=FALSE
RUN Rscript -e "renv::restore(prompt = FALSE)"

###Break - do NOT edit above###

FROM rocker/tidyverse:4.5.1

RUN mkdir -p /home/rstudio/project

RUN mkdir -p /home/rstudio/project/code \
    /home/rstudio/project/output
    
WORKDIR /home/rstudio/project

COPY --from=base /home/rstudio/project .

COPY raw_data/ raw_data/
COPY code/ code/
COPY Report.Rmd Report.Rmd
COPY Makefile Makefile


RUN mkdir -p report
RUN apt-get update && apt-get install -y pandoc

CMD ["make", "report"]