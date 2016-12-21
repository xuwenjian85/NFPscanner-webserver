# 用户上传自定义的参考网络库

argv <- commandArgs(TRUE);
input_data_num=as.numeric(argv[1]);#how many networks?
#input_data_num=2;#how many networks?
name=argv[2]
#name="myprofile" #save as myprofile.RData

setwd(argv[3])

s=c('igraph')
lapply(s,library,character.only = TRUE)
# install these packages 
# please load the test data file first.

ref.net=vector('list',length=0)
for (i in 1:input_data_num)
{
  # 依次读入customized_net*.graphml
  net<-read.graph(paste('customized_net',as.character(i),'.graphml',sep=""), format = "graphml")
  ref.net<-c(ref.net,list(net))
  rm(net)
}
save(ref.net, file=paste(name,'.RData',sep=""))