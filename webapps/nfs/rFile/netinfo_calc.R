argv <- commandArgs(TRUE);
s=c('igraph','ggplot2')
lapply(s,library,character.only = TRUE)
# install these packages, if not, install by command like this: install.packages("stringr")

setwd(argv[1])
#传入参数i，表示第i个网络
i <- as.numeric(argv[2])
#i=1 #####i是传入的参数，该行请注释

# 读入传入的网络：如果i==1，网络的输入文件是net1.graphml
# 读入net1网络
net<-read.graph(paste('net',as.character(i),'.graphml',sep=""), format = c("graphml"))

# net网络属性
v<-length(V(net))  #节点数为29
e<-length(E(net))  #边数为0
d<-graph.density(net) # 网络密度为0，Density (No of edges / possible edges)
t<-transitivity(net, type="global") # 聚类系数为NaN，Global clustering coefficient
net1.info <- list(v,e,d,t)
if (file.exists(paste('net',as.character(i),'.info',sep=""))) file.remove(paste('net',as.character(i),'.info',sep=""))
lapply(net1.info, write, paste('net',as.character(i),'.info',sep=""), append=TRUE)
# net缩略图展示
#jpeg(filename = paste('net',as.character(i),'.jpg',sep=""))
png(filename = paste('net',as.character(i),'.png',sep=""), type = "cairo")
plot <- plot(net, layout=layout.fruchterman.reingold, vertex.label=NA, vertex.size=8, edge.arrow.size=0.2)
print(plot)
dev.off()
