# setting seed to make results reproducible
set.seed(1234)

# Loading libraries needed
library(tidyverse)
library(palmerpenguins)

# Inspecting data
df <- penguins
glimpse(df)

# saving to directory
write.csv(df, 'data.csv')
saveRDS(df, 'dataset.rds')


# Measuring duration to load file to our workspace with system.time()

# csv file
system.time(read.csv('data.csv'))

# rds file
system.time(readRDS('dataset.rds'))



# Measuring duration to load file to our workspace with Sys.time()

# csv file
start <- Sys.time()
df <- read.csv('data.csv')

Sys.time() - start

# rds file
start_1 <- Sys.time()
dd <- readRDS('dataset.rds')
Sys.time() - start_1


# Measuring duration to load file to our workspace with proc.time()

# csv file
start_2 <- proc.time()
df <- read.csv('data.csv')

proc.time() - start_2

#rds file
start_3 <- proc.time()
dd <- readRDS('dataset.rds')

proc.time() - start_3

# Measuring duration to load file to our workspace with tic() and toc()
library(tictoc)

#csv file
tic()
df <- read.csv('data.csv')
toc()


# rds file
tic()
dd <- readRDS('dataset.rds')
toc()

# Measuring duration to load file to our workspace with rbenchmark
library(rbenchmark)

#csv file
benchmark(df <- read.csv('data.csv'))

#rds file
benchmark(dd <- readRDS('dataset.rds'))


# Measuring duration to load file to our workspace with microbenchmark()
library(microbenchmark)

# benchmarking, simulating 100 repititions
microbenchmark(df <- read.csv('data.csv'), dd <- readRDS('dataset.rds'), times = 100)