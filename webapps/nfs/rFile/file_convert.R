##########目前支持3种格式，"graphml","gml","edgelist"
##########该程序将这3种都转换为"graphml"格式，便于后续计算

argv <- commandArgs(TRUE);
s=c('igraph')
lapply(s,library,character.only = TRUE)
# install these packages, if not, install by command like this: install.packages("stringr")

setwd(argv[1])   #传入参数，设置工作目录
netformat <- as.character(argv[2])   #传入参数 输入文件类型
#netformat="gml"
inputnet <- as.character(argv[3])   #传入参数 输入文件名称
#inputnet="net2.gml"
outputnet <- as.character(argv[4])   #传入参数 输出文件名称
#outputnet="net2.graphml"


#inputnet <- "edgelist.txt"
#outputnet<- "edgelist.graphml"
library(igraph)

if (netformat=='edgelist')
{
  netdata <- as.matrix(read.table(inputnet,header=FALSE,colClasses = "character"));
  edgelist_data <- netdata[,1:2]
  edgelist_data_unique<-unique( edgelist_data)
  net <- graph.edgelist(edgelist_data_unique)
  E(net)$weight <- rep(1,nrow(netdata))
  write.graph(net, outputnet, format="graphml")
}
if (netformat=='gml' || netformat=='graphml')
{
  net<-read.graph(inputnet, format = netformat)
  write.graph(net, outputnet, format="graphml")
}


