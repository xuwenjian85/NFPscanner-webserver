argv <- commandArgs(TRUE);
s=c('stringr','plyr','KEGGgraph','igraph','apcluster','ggplot2','dplyr','magrittr')
lapply(s,library,character.only = TRUE)
# install these packages, if not, install by command like this: install.packages("stringr")

setwd(argv[1])

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

# 两两网络比较：两个网络的输入文件分别是net1.graphml和net2.graphml
# 读入net1网络
net1<-read.graph("net1.graphml", format = c("graphml"))
net2<-read.graph("net2.graphml", format = c("graphml"))
net2list<-list(net2) #将net2转换为列表


# 格式转换,输出node和edges
nodes <- matrix(nrow=length(V(net1)),ncol=2)
nodes[,1]<- V(net1)$id
nodes[,2]<- V(net1)$name
write.table(nodes, paste('net1.nodes',sep=""), col.names=FALSE)
edges <- matrix(nrow=length(E(net1)),ncol=2)
edges <- get.edgelist(net1)
edges <- cbind(edges, E(net1)$weight)
write.table(edges, paste('net1.edges',sep=""), col.names=FALSE)

nodes <- matrix(nrow=length(V(net2)),ncol=2)
nodes[,1]<- V(net2)$id
nodes[,2]<- V(net2)$name
write.table(nodes, paste('net2.nodes',sep=""), col.names=FALSE)
edges <- matrix(nrow=length(E(net2)),ncol=2)
edges <- get.edgelist(net2)
edges <- cbind(edges, E(net2)$weight)
write.table(edges, paste('net2.edges',sep=""), col.names=FALSE)

#调用函数进行网络相似性计算
result1<-mock_calc_net_finger_print(net1,net2list)
result2<-mock_retrieve_cluster_score(net1,net2list)
#输出结果1
if (file.exists("result1.netfingerprint")) file.remove("result1.netfingerprint")
lapply(result1[1], write, "result1.netfingerprint", append=TRUE)
if (file.exists("result1.net1_cluster_index")) file.remove("result1.net1_cluster_index")
lapply(result1[2], write, "result1.net1_cluster_index", append=TRUE)
if (file.exists("result1.net2_cluster_index")) file.remove("result1.net2_cluster_index")
lapply(result1[[3]], write, "result1.net2_cluster_index", append=TRUE)
if (file.exists("result1.cluster_score")) file.remove("result1.cluster_score")
lapply(result1[4], write, "result1.cluster_score", append=TRUE)
#输出结果2
if (file.exists("result2.net1_node_score")) file.remove("result2.net1_node_score")
lapply(result2[1], write, "result2.net1_node_score", append=TRUE)
if (file.exists("result2.net2_node_score")) file.remove("result2.net2_node_score")
lapply(result2[[2]], write, "result2.net2_node_score", append=TRUE)
