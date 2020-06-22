#BeveL Data Manipulation for betaseries
#JRS




library(tidyselect)
setwd("/Users/nikkibytes/Documents/choco_milkshake_evs")



######## TEST LOOP ################
splitfunc <- function(name){
  data <- read.delim(name, header = FALSE, sep = "\t", dec = ".")
  for (i in 1:nrow(data)) {
    x <- as.data.frame(data[i,], drop=false)
    y <- as.data.frame(data[-i,], drop=false)
    #print(y)
    ev_name = gsub('.ev',"",name)
    trialevfilename <- file.path(mypath, 'trial_evs', paste0(ev_name, "_", "trial",i,".txt"))
    nuisevfilename <- file.path(mypath, 'trial_evs', paste0(ev_name, "_", "nuis",i,".txt"))
    #print(paste('[INFO] ',trialevfilename))
    write.table(x, file = trialevfilename, sep = "\t", row.names = FALSE, col.names = FALSE)
    write.table(y, file = nuisevfilename, sep = "\t", row.names = FALSE, col.names = FALSE)
  }
}



# main
mypath <- '/Users/nikkibytes/Documents/choco_milkshake_evs'

filelist <- list.files(mypath, "*.ev")
print(filelist)

for (ev_file in filelist) {
  tryCatch(splitfunc(ev_file), error=function(e)
    paste("[INFO] ERROR FOUND"))
}



