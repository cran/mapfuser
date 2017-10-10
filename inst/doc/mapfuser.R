## ---- echo=TRUE, include=TRUE,message=FALSE------------------------------
library(mapfuser)

## Load example data
fpath <- system.file("extdata", package="mapfuser")
AT_maps <- list.files(fpath, 
                      pattern = "Col", 
                      full.names = T)

MF.obj <- read_maps(mapfiles = AT_maps, 
                    type = "delim", 
                    sep = ",",
                    mapweights = rep(1,7))

## Load a reference map
ref_file <- list.files(fpath, 
                       pattern = "reference", 
                       full.names = T)

MF.obj <- read_ref(MF.obj = MF.obj, 
                   ref_file = ref_file, 
                   sep = ",", 
                   header = T,
                   na.string = NA,
                   type = "delim")

## ---- message=FALSE------------------------------------------------------
## Linkage groups with insufficient markers are removed and each linkage group is alligned to the reference. 
MF.obj <- map_qc(MF.obj, anchors = 3)
### Plot input data as network
plot(MF.obj, which = "mapnetwork", chr = 1)
### Plot qc passed data
plot(MF.obj, which = "mst", chr = 1)
##See ?plot.mapfuser for further options

## ---- message=FALSE, warning=FALSE, fig.width=7, fig.height=7, dpi=36----
MF.obj <- LPmerge_par(MF.obj, n.cores = 2, max.interval = 1, max.int_sel = "auto")
plot(MF.obj, which = "single_map", maps = "consensus")


## ---- message=FALSE, fig.width=7, fig.height=7---------------------------
# Fit model
MF.obj <-  genphys_fit(MF.obj, type = "consensus", z = 5)
plot(MF.obj, which = "mareymap", maps = "consensus")

## ---- message=FALSE------------------------------------------------------
# Read a table with positions to interpolate and/or extrapolate
predict_file <- list.files(fpath, 
                       pattern = "BaySha_physical", 
                       full.names = T)
to_predict <- read.table(predict_file, sep = ",", header = T)
# Predict, accessible under MF.obj$predictions
MF.obj <- predict(MF.obj, to_predict)

