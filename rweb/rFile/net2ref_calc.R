# 多个网络和参考网络比较：net1.graphml、net2.graphml分别和KEGG_graph比较

argv <- commandArgs(TRUE);
input_data_num=as.numeric(argv[3]);#how many input_data?
#input_data_num=2;#how many input_data?

setwd(argv[1])

s=c('stringr','plyr','KEGGgraph','igraph','apcluster','ggplot2','dplyr','magrittr')
lapply(s,library,character.only = TRUE)
# install these packages 
# please load the test data file first.

# 载入参考网络KEGG_graph, 如果放在其他目录，请修改路径
load(argv[2])

mock_calc_net_finger_print <- function(net,refnet,option = data.frame)
  # dataframe as option
  
{  if (class(net) != 'igraph')
  stop("Please ensure your network is in graphNEL class")
  if (class(refnet) == 'list'){
    # calc netfingerprint and each cluster information
    print("Do some work here")
    print("some intermediate data will be kept for later visualization use")
  }
  netfingerprint <- rnorm(length(refnet),mean = 1,sd=2)
  # 可以绘制指纹图
  netnode_cluster_index <- rep(1:10,len =length(V(net)))
  # 表示net某个点属于某个cluster，形状或颜色
  refnetnode_cluster_index <- llply(refnet,function(x) rep(1:10,len =length(V(x))))
  # 表示refnet某个点属于某个cluster，形状或颜色
  score_of_cluster <- rnorm(10,mean = 1,sd=2)
  # 表示cluster得分，显示在cluster之间的横线上
  result <- list(netfingerprint=netfingerprint
                 ,netnode_cluster_index=netnode_cluster_index
                 ,refnetnode_cluster_index=refnetnode_cluster_index
                 ,score_of_cluster=score_of_cluster)
  print("return netfinger print and each node's cluster information")
  return(result)# 返回所有结果的列表
}

# for visualization of cluster on webserver
mock_retrieve_cluster_score <- function(net,refnet,option =data.frame)
{
  #net must be igraph class. and refnet must be a list
  #Use this function for cluster visualization
  node_score_in_net <- rnorm(length(V(net)),mean = 1,sd=2)
  #cluster的比对视图中，需要按照这个分数对其中的点排序，选前五个显示，其余隐藏，等待用户点扩展按钮
  node_score_in_refnet <- llply(refnet,function(x)rnorm(length(V(x)),mean = 1,sd=2))
  #cluster对比视图，点排序，前五个，其余隐藏
  result <- list(node_score_in_net = node_score_in_net,
                 node_score_in_refnet = node_score_in_refnet)
  return (result)
}

for (i in 1:input_data_num)
{
  # 依次读入net*.graphml
  dir.create(paste('net',as.character(i),sep=""))
  net<-read.graph(paste('net',as.character(i),'.graphml',sep=""), format = c("graphml"))
  # 计算
  # ��ʽת��
  #write.graph(net, paste('net',as.character(i),'/net.dot',sep=""), format="dot")
  nodes <- matrix(nrow=length(V(net)),ncol=2)
  nodes[,1]<- V(net)$id
  nodes[,2]<- V(net)$name
  write.table(nodes, paste('net',as.character(i),'/net.nodes',sep=""), col.names=FALSE)
  edges <- matrix(nrow=length(E(net)),ncol=2)
  edges <- get.edgelist(net)
  edges <- cbind(edges, E(net)$weight)
  write.table(edges, paste('net',as.character(i),'/net.edges',sep=""), col.names=FALSE)



  result1 <- mock_calc_net_finger_print(net,KEGG_graph)
  result2 <- mock_retrieve_cluster_score(net,KEGG_graph)
  # net1和net2的结果分别保存至net1/2文件夹
  #输出结果1  
  if (file.exists(paste('net',as.character(i),'/result1.netfingerprint',sep=""))) file.remove(paste('net',as.character(i),'/result1.netfingerprint',sep=""))
  lapply(result1[1], write, paste('net',as.character(i),'/result1.netfingerprint',sep=""), append=TRUE)
  if (file.exists(paste('net',as.character(i),'/result1.net_cluster_index',sep=""))) file.remove(paste('net',as.character(i),'/result1.net_cluster_index',sep=""))
  lapply(result1[2], write, paste('net',as.character(i),'/result1.net_cluster_index',sep=""), append=TRUE)
  if (file.exists(paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""))) file.remove(paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""))
  for (j in 1:length(result1[[3]]))
  {
    lapply(paste('#refnet',as.character(j),sep=""), write, paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""), append=TRUE)
    lapply(result1[[3]][j], write, paste('net',as.character(i),'/result1.refnet_cluster_index',sep=""), append=TRUE)
  }
  if (file.exists(paste('net',as.character(i),'/result1.cluster_score',sep=""))) file.remove(paste('net',as.character(i),'/result1.cluster_score',sep=""))
  lapply(result1[4], write, paste('net',as.character(i),'/result1.cluster_score',sep=""), append=TRUE)
  #输出结果2
  if (file.exists(paste('net',as.character(i),'/result2.net_node_score',sep=""))) file.remove(paste('net',as.character(i),'/result2.net_node_score',sep=""))
  lapply(result2[1], write, paste('net',as.character(i),'/result2.net_node_score',sep=""), append=TRUE)
  if (file.exists(paste('net',as.character(i),'/result2.refnet_node_score',sep=""))) file.remove(paste('net',as.character(i),'/result2.refnet_node_score',sep=""))
  for (j in 1:length(result2[[2]]))
  {
    lapply(paste('#refnet',as.character(j),sep=""), write, paste('net',as.character(i),'/result2.refnet_node_score',sep=""), append=TRUE)
    lapply(result2[[2]][j], write, paste('net',as.character(i),'/result2.refnet_node_score',sep=""), append=TRUE)
  }
  rm(net)
}
