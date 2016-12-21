# 多个网络和参考网络比较时的其他分析：net1.graphml、net2.graphml和网络库比较

argv <- commandArgs(TRUE);
input_data_num=as.numeric(argv[3]);#how many input_data?
#input_data_num=2;#how many input_data?

setwd(argv[1])

library(igraph)

library(clusterProfiler)


# 载入参考网络, 如果放在其他目录，请修改路径
load(argv[2])
#load('/root/refnet_new/nci_signaling_refnet/nci_signaling_refnet.RData')

for (i in 1:input_data_num)
{
  # 依次读入net*.graphml
  if (!file.exists(paste('net',as.character(i),sep=""))){
     dir.create(paste('net',as.character(i),sep=""))
  }
  net<-read.graph(paste('net',as.character(i),'.graphml',sep=""), format = c("graphml"))
  # net1和net2的结果分别保存至net1/2文件夹下的anno文件夹中
  #其他生信分析
  for (k in 1:length(ref.net$network))
  {
    if (!file.exists(file.path(paste('net',as.character(i),sep=""), '/anno'))){
       dir.create(file.path(paste('net',as.character(i),sep=""), '/anno'))
    }
    net2<-ref.net$network[[k]]
    nodes12<-c(V(net)$name, V(net2)$name)
    nodes_unique<-unique(nodes12)
    ego_nodes <- enrichGO(gene = nodes_unique,
    organism = "human",
    pAdjustMethod = "BH",
    pvalueCutoff = 0.01,
    qvalueCutoff = 0.05,
    readable = FALSE)
    result_ego<-data.frame(summary(ego_nodes))
    if (nrow(result_ego)>20) {result_ego_top20 <- result_ego[1:20,c(1,2,3,5,8)]} else{result_ego_top20 <- result_ego[,c(1,2,3,5,8)]}
    write.table(result_ego_top20, paste("net",as.character(i),"/anno/refnet",as.character(k),".result.ego_top20.txt",sep=""), row.names = FALSE, sep="\t")

    ekg_nodes <- enrichKEGG(gene = nodes_unique,
    organism = "human",
    pvalueCutoff = 0.05,
    readable = FALSE)
    result_ekg<-data.frame(summary(ekg_nodes))
    if (nrow(result_ekg)>20) {result_ekg_top20 <- result_ekg[1:20,c(1,2,3,5,8)]} else{result_ekg_top20 <- result_ekg[,c(1,2,3,5,8)]}
    write.table(result_ekg_top20, paste("net",as.character(i),"/anno/refnet",as.character(k),".result.ekg_top20.txt",sep=""), row.names = FALSE, sep="\t")
  }
}
