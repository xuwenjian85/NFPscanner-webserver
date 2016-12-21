argv <- commandArgs(TRUE);
require(igraph)
require(KEGGgraph)
require(plyr)
require(dplyr)
require(AnnotationDbi)
require(apcluster)

setwd(argv[1])
# 两两网络比较：两个网络的输入文件分别是net1.graphml和net2.graphml
# 读入net1网络
net1<-read.graph("net1.graphml", format = c("graphml"))
net2<-read.graph("net2.graphml", format = c("graphml"))

# 输出net1和net2的node和edges
nodes <- matrix(nrow=length(V(net1)),ncol=1)
nodes[,1]<- V(net1)$name
write.table(nodes, paste('net1.nodes',sep=""), col.names=FALSE)
edges <- matrix(nrow=length(E(net1)),ncol=2)
edges <- get.edgelist(net1)
write.table(edges, paste('net1.edges',sep=""), col.names=FALSE)

nodes <- matrix(nrow=length(V(net2)),ncol=1)
nodes[,1]<- V(net2)$name
write.table(nodes, paste('net2.nodes',sep=""), col.names=FALSE)
edges <- matrix(nrow=length(E(net2)),ncol=2)
edges <- get.edgelist(net2)
write.table(edges, paste('net2.edges',sep=""), col.names=FALSE)

library(clusterProfiler)
#其他生信分析
nodes12<-c(V(net1)$name, V(net2)$name)
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
write.table(result_ego_top20, "result.ego_top20.txt", row.names = FALSE, sep="\t")

ekg_nodes <- enrichKEGG(gene = nodes_unique,
organism = "human",
pvalueCutoff = 0.05,
readable = FALSE)
result_ekg<-data.frame(summary(ekg_nodes))
if (nrow(result_ekg)>20) {result_ekg_top20 <- result_ekg[1:20,c(1,2,3,5,8)]} else{result_ekg_top20 <- result_ekg[,c(1,2,3,5,8)]}
result_ekg_top20$pvalue<-format(result_ekg_top20$pvalue,digits=3)
write.table(result_ekg_top20, "result.ekg_top20.txt", row.names = FALSE, sep="\t")



#将net2转换为列表
net2_refnet = list(
  network = list(net2),
  annotation = data.frame( name = names(net2), 
                           stringsAsFactors=FALSE
  ),
  public = FALSE,
  organism = "Homo sapiens"
)

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

#option[2,3]="sequence"

option= read.table(argv[2],header=TRUE,sep=",",strip.white=TRUE, stringsAsFactors=FALSE)
#真实算法
source("/jianshutong/apache-tomcat-7.0.64/webapps/nfs/rFile/function_definitions_xwj.R")
# FUNCTION Definition END HERE!



#调用函数进行网络相似性计r
errorlog <- file("R_error.log",open = "wt") # xu wenjian added on 2015/12/15
sink(errorlog, type = "message")
result1<-calc_sim_score_main(net1,net2_refnet,option, ".")
sink(type = "message")
close(errorlog)

#result1<-mock_calc_net_finger_print(net1,net2list)
#result2<-mock_retrieve_cluster_score(net1,net2list)
#输出结果1
if (file.exists("result1.networkfingerprint")) file.remove("result1.netfingerprint")
temp<-list(round(result1[[1]],2))
lapply(temp, write, "result1.netfingerprint", append=TRUE)
rm(temp)
if (file.exists("result1.netnode_cluster_index")) file.remove("result1.net1_cluster_index")
lapply("#net1 node cluster index", write, "result1.net1_cluster_index", append=TRUE)
lapply(result1[[2]], write, "result1.net1_cluster_index", append=TRUE)
lapply("#net1 node names", write, "result1.net1_cluster_index", append=TRUE)
lapply(list(names(c(result1[[2]][[1]]))), write, "result1.net1_cluster_index", append=TRUE,ncolumns=5)
if (file.exists("result1.refnetnode_cluster_index")) file.remove("result1.net2_cluster_index")
lapply("#net2 node cluster index", write, "result1.net2_cluster_index", append=TRUE)
lapply(result1[[3]], write, "result1.net2_cluster_index", append=TRUE)
lapply("#net2 node names", write, "result1.net2_cluster_index", append=TRUE)
lapply(list(names(c(result1[[3]][[1]]))), write, "result1.net2_cluster_index", append=TRUE,ncolumns=5)
if (file.exists("result1.score_of_cluster")) file.remove("result1.cluster_score")
temp<-as.numeric(result1[[4]][[1]])
temp<-list(round(temp,2))
lapply(temp, write, "result1.cluster_score", append=TRUE)
rm(temp)