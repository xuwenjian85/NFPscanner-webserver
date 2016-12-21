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
     # ���Ի���ָ��ͼ
  netnode_cluster_index <- rep(1:10,len =length(V(net)))
     # ��ʾnetĳ��������ĳ��cluster����״����ɫ
  refnetnode_cluster_index <- llply(refnet,function(x) rep(1:10,len =length(V(x))))
     # ��ʾrefnetĳ��������ĳ��cluster����״����ɫ
  score_of_cluster <- rnorm(10,mean = 1,sd=2)
     # ��ʾcluster�÷֣���ʾ��cluster֮��ĺ�����
  result <- list(netfingerprint=netfingerprint
                 ,netnode_cluster_index=netnode_cluster_index
                 ,refnetnode_cluster_index=refnetnode_cluster_index
                 ,score_of_cluster=score_of_cluster)
  print("return netfinger print and each node's cluster information")
  return(result)# �������н�����б�
}

# for visualization of cluster on webserver
mock_retrieve_cluster_score <- function(net,refnet,option =data.frame)
{
  #net must be igraph class. and refnet must be a list
  #Use this function for cluster visualization
  node_score_in_net <- rnorm(length(V(net)),mean = 1,sd=2)
    #cluster�ıȶ���ͼ�У���Ҫ����������������еĵ�����ѡǰ�����ʾ���������أ��ȴ��û�����չ��ť
  node_score_in_refnet <- llply(refnet,function(x)rnorm(length(V(x)),mean = 1,sd=2))
    #cluster�Ա���ͼ��������ǰ�������������
  result <- list(node_score_in_net = node_score_in_net,
                 node_score_in_refnet = node_score_in_refnet)
  return (result)
}

# ��������Ƚϣ���������������ļ��ֱ���net1.graphml��net2.graphml
# ����net1����
net1<-read.graph("net1.graphml", format = c("graphml"))
net2<-read.graph("net2.graphml", format = c("graphml"))
net2list<-list(net2) #��net2ת��Ϊ�б�


# ��ʽת��,���node��edges
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

#���ú����������������Լ���
result1<-mock_calc_net_finger_print(net1,net2list)
result2<-mock_retrieve_cluster_score(net1,net2list)
#������1
if (file.exists("result1.netfingerprint")) file.remove("result1.netfingerprint")
lapply(result1[1], write, "result1.netfingerprint", append=TRUE)
if (file.exists("result1.net1_cluster_index")) file.remove("result1.net1_cluster_index")
lapply(result1[2], write, "result1.net1_cluster_index", append=TRUE)
if (file.exists("result1.net2_cluster_index")) file.remove("result1.net2_cluster_index")
lapply(result1[[3]], write, "result1.net2_cluster_index", append=TRUE)
if (file.exists("result1.cluster_score")) file.remove("result1.cluster_score")
lapply(result1[4], write, "result1.cluster_score", append=TRUE)
#������2
if (file.exists("result2.net1_node_score")) file.remove("result2.net1_node_score")
lapply(result2[1], write, "result2.net1_node_score", append=TRUE)
if (file.exists("result2.net2_node_score")) file.remove("result2.net2_node_score")
lapply(result2[[2]], write, "result2.net2_node_score", append=TRUE)