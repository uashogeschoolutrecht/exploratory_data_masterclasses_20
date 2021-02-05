#!/usr/bin/env Rscript

## as root run in the Terminal
# Rscript install_server_r_packages.R

url <- "https://raw.githubusercontent.com/uashogeschoolutrecht/exploratory_data_masterclasses_20/master/DEPENDENCIES.txt"

download.file(url = url, destfile = "DEPENDENCIES.txt")

lib_path <- .libPaths()[2] 
install.packages("tidyverse", lib = lib_path, dependencies = TRUE)
pkgs <- readr::read_csv("DEPENDENCIES.txt")

purrr::walk(
  pkgs$package_name,
  install.packages,
  lib = lib_path,
  dependencies = TRUE
)