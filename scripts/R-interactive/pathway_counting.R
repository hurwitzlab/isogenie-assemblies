setwd("~/isogenie-assemblies/prokka_annotations")
library("plyr")
library("dplyr")
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
df <- ldply(finally, data.frame)

groupies <- group_by(df, sample, EC_number)
ECcounts <- summarise(groupies, EC_count=n())

#what's in 1 but not in 2
setdiff(finally[[1]]$EC_number,finally[[2]]$EC_number)

which(finally[[1]]$EC_number=="4.1.99.14")
which(finally[[2]]$EC_number=="4.1.99.14")

length(which(ECcounts$sample=="Day0_Erio"))
#2048
length(which(ECcounts$sample=="Day50_Erio"))
#1874
length(which(ECcounts$sample=="Day0_SPH"))
#1978
length(which(ECcounts$sample=="Day50_SPH"))
#1977
