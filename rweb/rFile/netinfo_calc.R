argv <- commandArgs(TRUE);
s=c('igraph','ggplot2')
lapply(s,library,character.only = TRUE)
# install these packages, if not, install by command like this: install.packages("stringr")

setwd(argv[1])
#�������i����ʾ��i������
i <- as.numeric(argv[2])
#i=1 #####i�Ǵ���Ĳ�����������ע��

# ���봫������磺���i==1������������ļ���net1.graphml
# ����net1����
net<-read.graph(paste('net',as.character(i),'.graphml',sep=""), format = c("graphml"))

# net��������
v<-length(V(net))  #�ڵ���Ϊ29
e<-length(E(net))  #����Ϊ0
d<-graph.density(net) # �����ܶ�Ϊ0��Density (No of edges / possible edges)
t<-transitivity(net, type="global") # ����ϵ��ΪNaN��Global clustering coefficient
net1.info <- list(v,e,d,t)
if (file.exists(paste('net',as.character(i),'.info',sep=""))) file.remove(paste('net',as.character(i),'.info',sep=""))
lapply(net1.info, write, paste('net',as.character(i),'.info',sep=""), append=TRUE)
# net����ͼչʾ
#jpeg(filename = paste('net',as.character(i),'.jpg',sep=""))
png(filename = paste('net',as.character(i),'.png',sep=""), type = "cairo")
plot <- plot(net, layout=layout.fruchterman.reingold, vertex.label=NA, vertex.size=8, edge.arrow.size=0.2)
print(plot)
dev.off()