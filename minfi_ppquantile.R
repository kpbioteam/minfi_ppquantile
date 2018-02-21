require("minfi", quietly = TRUE)

args <- commandArgs(trailingOnly = TRUE)

input = args[1]
output = args[2]

RGSet <- get(load(input))

GRSet <- preprocessQuantile(RGSet, fixOutliers = TRUE,
  removeBadSamples = TRUE, badSampleCutoff = 10.5,
  quantileNormalize = TRUE, stratified = TRUE, 
  mergeManifest = FALSE, sex = NULL)

save(GRSet,file = output)
