setwd("~/isogenie-assemblies/prokka_annotations")

temp = list.files(recursive=TRUE,pattern="*.tsv")
myfiles = lapply(temp, read.delim)
sample_names <- as.list(sub('\\/PROKKA.*tsv', "", temp, perl=T))
myfiles = Map(cbind, myfiles, sample = sample_names)
myfiles = Map(function(x) {x[x$EC_number!='',]}, myfiles)

onlyEC = function(df) {
  correct=grep('\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}',df$EC_number,perl=T)
  df=df[correct,]
  return(df)
}

finally = Map(onlyEC,myfiles)
