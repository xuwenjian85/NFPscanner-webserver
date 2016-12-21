# 多个网络和参考网络比较：net1.graphml、net2.graphml分别和KEGG_graph比较

argv <- commandArgs(TRUE);
input_data_num=as.numeric(argv[3]);#how many input_data?
#input_data_num=2;#how many input_data?

setwd(argv[1])


# 载入参考网络, 如果放在其他目录，请修改路径
load(argv[2])
#load('/root/refnet_new/nci_signaling_refnet/nci_signaling_refnet.RData')

# 载入算法参数的文件
# receive options from webserver interface: long string, 
#option= read.table(text=
# "algorithm, parameters, default_value
#  NFP, algorithm, 'APCLUSTER' #('APCLUSTER', 'GHOST','SPINAL','ISORANK')
#  NFP, sim, 'geneontology' #('sequence','geneontology')
#  NFP,nperm, 10 #(10~1000,integer)
#  ISORANK, K, 10 #(10~30,integer)
#  ISORANK, thresh, 0.0001#(1e-5 ~ 1e-3)
#  ISORANK, alpha, 0.6#(0.2~1)
#  ISORANK, beta,0.5 #(0.25~0.75)
#  ISORANK, maxveclen, 1000k #(200k~5000k,integer)
#  GHOST, hops, 4 #(2~6,integer)
#  GHOST, nneighbors,-1 #(-1~10,integer)
#  GHOST, searchiter,10 #(5~15,integer)
#  GHOST, ratio,8 #(4~10,integer)
#  SPINAL, alpha,0.7 #(0~1)
#  APCLUSTER, q, NA #(0~1)
#  APCLUSTER, maxits,1000 #(100~10000,integer)
#  APCLUSTER, convits,100 #(50~150,integer)
#  APCLUSTER, lam, 0.9 #(0.5~1)
#  APCLUSTER, nonoise, FALSE #(TRUE, FALSE)
#"
#, header=TRUE,sep=",",strip.white=TRUE, stringsAsFactors=FALSE)

option= read.table(argv[4],header=TRUE,sep=",",strip.white=TRUE, stringsAsFactors=FALSE)

require(igraph)
# require(KEGGgraph)
require(plyr)
require(dplyr)
require(AnnotationDbi)
require(apcluster)
# Import FUNCTION Definitions HERE!
source("/jianshutong/apache-tomcat-7.0.64/webapps/nfs/rFile/function_definitions_xwj.R")

homedir <- getwd()
#setwd("/root/NFPportable/refnet")
#if(!(exists('SequencescoreData'))) load("SequencescoreData.rdata")
#if(!(exists("GeneontologyData"))) load("GeneontologyData.rdata")
#setwd(homedir) # deleted by xwj 2015/12/15 载入数据的步骤在函数中已经包括了

for (i in 1:input_data_num)
{
  # 依次读入net*.graphml
  if (!file.exists(paste('net',as.character(i),sep=""))){
     dir.create(paste('net',as.character(i),sep=""))
  }
  net<-read.graph(paste('net',as.character(i),'.graphml',sep=""), format = c("graphml"))
  # 计算
  #write.graph(net, paste('net',as.character(i),'/net.dot',sep=""), format="dot")
  nodes <- matrix(nrow=length(V(net)),ncol=1)
  nodes[,1]<- V(net)$name
  write.table(nodes, paste('net',as.character(i),'/net.nodes',sep=""), col.names=FALSE)
  edges <- matrix(nrow=length(E(net)),ncol=2)
  edges <- get.edgelist(net)
  write.table(edges, paste('net',as.character(i),'/net.edges',sep=""), col.names=FALSE)

  # net1和net2的结果分别保存至net1/2文件夹
  errorlog <- file("R_error.log",open = "wt") # xu wenjian added on 2015/12/15
  sink(errorlog, type = "message")
  result1 <- calc_sim_score_main(net,ref.net,option, ".")
  sink(type = "message")
  close(errorlog)
  setwd(homedir)

  #输出结果1  
  if (file.exists(paste('net',as.character(i),'/result1.netfingerprint',sep=""))) file.remove(paste('net',as.character(i),'/result1.netfingerprint',sep=""))
  temp<-list(round(result1[[1]],2))
  lapply(temp, write, paste('net',as.character(i),'/result1.netfingerprint',sep=""), append=TRUE)
  rm(temp)
  if (file.exists(paste('net',as.character(i),'/result1.net_cluster_index',sep=""))) file.remove(paste('net',as.character(i),'/result1.net_cluster_index',sep=""))
  for (j in 1:length(result1[[2]]))
  {
    lapply(paste('#query net cluster index for refnet',as.character(j),sep=""), write, paste('net',as.character(i),'/result1.net_cluster_index',sep=""), append=TRUE)
    lapply(result1[[2]][j], write, paste('net',as.character(i),'/result1.net_cluster_index',sep=""), append=TRUE)
    lapply(paste('#query net node names for refnet',as.character(j),sep=""), write, paste('net',as.character(i),'/result1.net_cluster_index',sep=""), append=TRUE)
    lapply(list(names(c(result1[[2]][[j]]))), write, paste('net',as.character(i),'/result1.net_cluster_index',sep=""), append=TRUE,ncolumns=5)
  }
# lapply(result1[2], write, paste('net',as.character(i),'/result1.net_cluster_index',sep=""), append=TRUE)
  if (file.exists(paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""))) file.remove(paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""))
  for (j in 1:length(result1[[3]]))
  {
    lapply(paste('#refnet',as.character(j),sep=""), write, paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""), append=TRUE)
    lapply(result1[[3]][j], write, paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""), append=TRUE)
    lapply(paste('#refnet',as.character(j)," node names",sep=""), write, paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""), append=TRUE)
    lapply(list(names(c(result1[[3]][[j]]))), write, paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""), append=TRUE,ncolumns=5)
  }
  if (file.exists(paste('net',as.character(i),'/result1.cluster_score',sep=""))) file.remove(paste('net',as.character(i),'/result1.cluster_score',sep=""))
#  lapply(result1[4], write, paste('net',as.character(i),'/result1.cluster_score',sep=""), append=TRUE)
  for (j in 1:length(result1[[4]]))
  {
    lapply(paste('#cluster score for refnet',as.character(j),sep=""), write, paste('net',as.character(i),'/result1.cluster_score',sep=""), append=TRUE)
    temp<-as.numeric(result1[[4]][[j]])
    temp<-list(round(temp,2))
    lapply(temp, write, paste('net',as.character(i),'/result1.cluster_score',sep=""), append=TRUE)
  }
  rm(net)
  rm(temp)
}


setwd(argv[1])
library(igraph)
library(clusterProfiler)
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
    result_ego_top20$pvalue<-format(result_ego_top20$pvalue,digits=3)
    write.table(result_ego_top20, paste("net",as.character(i),"/anno/refnet",as.character(k),".result.ego_top20.txt",sep=""), row.names = FALSE, sep="\t")

    ekg_nodes <- enrichKEGG(gene = nodes_unique,
    organism = "human",
    pvalueCutoff = 0.05,
    readable = FALSE)
    result_ekg<-data.frame(summary(ekg_nodes))
    if (nrow(result_ekg)>20) {result_ekg_top20 <- result_ekg[1:20,c(1,2,3,5,8)]} else{result_ekg_top20 <- result_ekg[,c(1,2,3,5,8)]}
    result_ekg_top20$pvalue<-format(result_ekg_top20$pvalue,digits=3)
    write.table(result_ekg_top20, paste("net",as.character(i),"/anno/refnet",as.character(k),".result.ekg_top20.txt",sep=""), row.names = FALSE, sep="\t")
  }
}
