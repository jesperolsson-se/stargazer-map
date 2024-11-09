FROM rocker/tidyverse
RUN R -e "install.packages(c('ggmap', 'maps'))"
COPY script.R .
CMD ["Rscript", "script.R"]
