# Main script of SNF, which contains the web page of "SNF/Analysis"

argv <- commandArgs(TRUE);
#input_data_num=as.numeric(argv[1]);#how many input_data?
#path_input_data=as.character(argv[2]);#where are input_data?
#neighbor_num=as.numeric(argv[3]);#number of neighbors, usually (10~30),20 default.
#alpha=as.numeric(argv[4]);#hyperparameter, usually (0.3~0.8),0.5 default.
#iteration_num=as.numeric(argv[5]);#Number of Iterations, usually (10~20), 20 default.
#cluster_num=as.numeric(argv[6]);#optional parameter,number of clusters,0 default.If user don't give the number,the parameter is 0 default,then we will caculate it.
#if_norm=as.vector(argv[7]);#A vector of logical number.if user chose the preprocessing about normalization with the nst data type, the nst number in this vector is 1, else it will be 0. All 0 default.
#if_log2=as.vector(argv[8]);#A vector of logical number.if user chose the preprocessing about log2transformationwith the nst data type, the nst number in this vector is 1, else it will be 0. All 0 default.
#input_data_type=as.vector(argv[9]);#A vector of number.input data type,1 for continuous variables, 2 for discrete variables.
#path_output_data=as.character(argv[10]);#where are output_data?
input_data_num=as.numeric(argv[2]);#3;#how many input_data?
path_input_data=argv[1];#'input/';#where are input_data?
neighbor_num=as.numeric(argv[3]);#20;#number of neighbors, usually (10~30),20 default.
alpha=as.numeric(argv[4]);#0.5;#hyperparameter, usually (0.3~0.8),0.5 default.
iteration_num=as.numeric(argv[5]);#20;#Number of Iterations, usually (10~20), 20 default.
cluster_num=as.numeric(argv[6]);#3;#optional parameter,number of clusters,0 default.If user don't give the number,the parameter is 0 default,then we will caculate it.
if_norm=c(as.integer(strsplit(argv[7], split=",")[[1]]));#A vector of logical number.if user chose the preprocessing about normalization with the nst data type, the nst number in this vector is 1, else it will be 0. All 0 default.
if_log2=c(as.integer(strsplit(argv[8], split=",")[[1]]));#A vector of logical number.if user chose the preprocessing about log2transformationwith the nst data type, the nst number in this vector is 1, else it will be 0. All 0 default.
input_data_type=c(as.integer(strsplit(argv[9], split=",")[[1]]));#A vector of number.input data type,1 for continuous variables, 2 for discrete variables.
path_output_data='output/';#where are output_data?
setwd(argv[1]);


################################inputdata preprocessing#######################
library(SNFtool);

data_temp=as.matrix(read.table(paste(path_input_data,'data1.txt',sep=""),header=TRUE,row.names=1,sep="\t"));
input_data=list(data_temp);
rm(data_temp);
for (i in 2:input_data_num)
{
  data_temp=as.matrix(read.table(paste(path_input_data,'data',as.character(i),'.txt',sep=""),header=TRUE,row.names=1,sep="\t"));
  input_data=c(input_data,list(data_temp));
  rm(data_temp);
}#store input data into the list 'input_data'


for (i in 1:input_data_num)
{
  if (if_log2[i])
    input_data[[i]]=log2(input_data[[i]]);
}
#input data preprocessing about log2transformation


for (i in 1:input_data_num)
{
  if (if_norm[i])
  {
    input_data[[i]]=t(input_data[[i]]);
    input_data[[i]]=standardNormalization(input_data[[i]]);
    input_data[[i]]=t(input_data[[i]]);
  }
}#input data preprocessing about normalization



####################################SNF analysis######################################
for (i in 1:input_data_num)
{
  input_data[[i]]=t(input_data[[i]]);
}


if (input_data_type[1]==1)#calculate the distance for continuous variables
{
  Dist_temp=dist2(input_data[[1]],input_data[[1]]);
}else
{
  Dist_temp=chiDist2(input_data[[1]],input_data[[1]]);
}
Dist=list(Dist_temp);# distance matrix of data1,data2,...,datan
rm(Dist_temp);
for (i in 2:input_data_num)
{
  if (input_data_type[i]==1)
  {
    Dist_temp=dist2(input_data[[i]],input_data[[i]]);
  }else
  {
    Dist_temp=chiDist2(input_data[[i]],input_data[[i]]);
  }
  Dist=c(Dist,list(Dist_temp));
  rm(Dist_temp);
}


W_temp=affinityMatrix(Dist[[1]], neighbor_num, alpha);
W=list(W_temp);#similarity matrix of data1,data2,...datan for heatmap
rm(W_temp);
for (i in 2:input_data_num)
{
  W_temp=affinityMatrix(Dist[[i]], neighbor_num, alpha);
  W=c(W,list(W_temp));
  rm(W_temp);
}
W_result = SNF(W, neighbor_num, iteration_num);#similarity matrix of data_result(after the SNF calculation) for heatmap

###########output1###############
for (i in 1:input_data_num)
{
  write.table(W[[i]],file=paste(path_output_data,'heatmap_of_data',as.character(i),'.txt',sep=""),sep="\t");
}#similarity matrix of data1,data2,...datan for heatmap
write.table(W_result,file=paste(path_output_data,'heatmap_of_data_result.txt',sep=""),sep="\t");
#similarity matrix of data_result(after the SNF calculation) for heatmap


###############################cluster number estimation#####################
if (cluster_num==0)# if user donnot give the number of clusters, we recommand the number.
{
  estimationResult = estimateNumberOfClustersGivenGraph(W_result, 2:5);
  cluster_num=estimationResult[[1]];
}
##############cluster##############
cluster_group = spectralClustering(W_result,cluster_num);#cluster. A vector of sample group label.
############output2################
write.table(cluster_group,file=paste(path_output_data,'cluster_group.txt',sep=""),sep="\t");
#cluster group



########################adjacent matrix######################
m=1;
network_W_temp=matrix(1,nrow=nrow(W[[1]])*nrow(W[[1]]),ncol=3);
for (j in 1:nrow(W[[1]]))
  for (k in 1:nrow(W[[1]]))
  {
    network_W_temp[m,1]=j;
    network_W_temp[m,2]=k;
    network_W_temp[m,3]=W[[1]][j,k];
    m=m+1;
  }
network_W=list(network_W_temp);#adjacent matrix of data1,data2,...datan for network cytoscape
rm(network_W_temp);
for (i in 2:input_data_num)
{
  m=1;
  network_W_temp=matrix(1,nrow=nrow(W[[i]])*nrow(W[[i]]),ncol=3);
  for (j in 1:nrow(W[[i]]))
    for (k in 1:nrow(W[[i]]))
    {
      network_W_temp[m,1]=j;
      network_W_temp[m,2]=k;
      network_W_temp[m,3]=W[[i]][j,k];
      m=m+1;
    }
  network_W=c(network_W,list(network_W_temp));
  rm(network_W_temp);
}

m=1;
network_W_result=matrix(1,nrow=nrow(W_result)*nrow(W_result),ncol=3);
for (j in 1:nrow(W_result))
  for (k in 1:nrow(W_result))
  {
    network_W_result[m,1]=j;
    network_W_result[m,2]=k;
    network_W_result[m,3]=W_result[j,k];
    m=m+1;
  }#adjacent matrix of data_result(after the SNF calculation) for network cytoscape
#############output3############
for (i in 1:input_data_num)
{
  write.table(network_W[[i]],file=paste(path_output_data,'network_of_data',as.character(i),'.txt',sep=""),sep="\t");
}#adjacent matrix of data1,data2,...datan for network cytoscape
write.table(network_W_result,file=paste(path_output_data,'network_of_data_result.txt',sep=""),sep="\t");
#adjacent matrix of data_result(after the SNF calculation) for network cytoscape


############################festure rank by NMI#################################
NMI_scores <- rankFeaturesByNMI(input_data, W_result)#List of list.rank features by NMI. 
#NMI_scores[[1]] is the list of NMI value, NMI_scores[[2]] is the list of NMI rank.
#NMI_scores[[1]][[i]]is the vector of the ith data's NMI value,NMI_scores[[2]][[i]] is the vector of the ith data's NMI rank.

NMI_result_temp=matrix(1,nrow=ncol(input_data[[1]]),ncol=3);
NMI_result=list(NMI_result_temp);#the result of NMI rank.
rm(NMI_result_temp);
for (i in 2:input_data_num)
{
  NMI_result_temp=matrix(1,nrow=ncol(input_data[[i]]),ncol=3);
  NMI_result=c(NMI_result,list(NMI_result_temp));
  rm(NMI_result_temp);
}
for (i in 1:input_data_num)
{
  for (j in 1:length(NMI_scores[[1]][[i]]))
  {
    NMI_result[[i]][j,1]=colnames(input_data[[i]])[j];
    NMI_result[[i]][j,2]=NMI_scores[[1]][[i]][j];
    NMI_result[[i]][j,3]=NMI_scores[[2]][[i]][j];
  }
}
##########output4##########
for (i in 1:input_data_num)
{
  write.table(NMI_result[[i]],file=paste(path_output_data,'NMI_rank_of_data',as.character(i),'.txt',sep=""),sep="\t");
}#the 1st col represent the name of features, the 2nd col represent the NMI value of features, the 3rd col represent the rank of NMI of features.



###############################other result###########################
subtype_rank=list(1);
for (i in 2:cluster_num)
{
  subtype_rank=c(subtype_rank,1);
}
for (i in 1:cluster_num)
{
  subtype_rank[[i]][1]=1;
  k=1;
  for (j in 1:length(cluster_group))
  {
    if (cluster_group[j]==i)
    {
      subtype_rank[[i]][k]=j;
      k=k+1;
    }
  }
}

heatmap_feature_rank=list(1);
for (i in 2:input_data_num)
{
  heatmap_feature_rank=c(heatmap_feature_rank,1);
}
for (i in 1:input_data_num)
{
  region=0.1*ncol(input_data[[i]]);
  k=1;
  for (j in 1:ncol(input_data[[i]]))
  {
    if (NMI_scores[[2]][[i]][j]<=region)
    {
      heatmap_feature_rank[[i]][k]=j;
      k=k+1;
    }
  }
}

other_result=list(1);#heatmap of feature rank,list.
for (i in 2:(cluster_num*input_data_num))
{
  other_result=c(other_result,1);
}
k=1;
for (i in 1:input_data_num)
{
  for (j in 1:cluster_num)
  {
      other_result[[k]]=matrix(1,nrow=length(heatmap_feature_rank[[i]]),ncol=length(subtype_rank[[j]]));
      for (m in 1:length(heatmap_feature_rank[[i]]))
      {
        for (n in 1:length(subtype_rank[[j]]))
        {
          other_result[[k]][m,n]=input_data[[i]][subtype_rank[[j]][n],heatmap_feature_rank[[i]][m]];
        }
      }
      k=k+1;
  }
}
###########output5###########
for (i in 1:length(other_result))
{
  write.table(other_result[[i]],file=paste(path_output_data,'other_result_matrix',as.character(i),'.txt',sep=""),sep="\t")
}#list of matrix. In each matrix, row represents the top 10% features of data type X, col represents samples in subtype y.
#if the input data is of m type, and the cluster group is n, then the number of matrix in the list is m*n.
#all the matrixs form a big matrix, which of the row is data type,and which of the col is subtype(cluster group).

