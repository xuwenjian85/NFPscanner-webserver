argv <- commandArgs(TRUE);
s=c('igraph','ggplot2')
lapply(s,library,character.only = TRUE)
# install these packages, if not, install by command like this: install.packages("stringr")

#refnet_name="nci_signaling_refnet"
refnet_name<-argv[1]
load(paste(refnet_name,".RData",sep=""))
dir.create(refnet_name)

setwd(paste('./',refnet_name,sep=""))

save(ref.net, file=paste(name,'.RData',sep=""))

#保存anno文件
refnet_anno <- matrix(nrow=11,ncol=1)
rownames(refnet_anno) <- c("id", "name", "network_sum", "description", "create_time", "create_user", "update_time", "update_user", "public", "organism", "")
refnet_anno[1,1] <- refnet_name
refnet_anno[2,1] <- ref.net$name
refnet_anno[3,1] <- length(ref.net$network)
refnet_anno[4,1] <- ref.net$description
refnet_anno[5,1] <- ref.net$create_time
refnet_anno[6,1] <- ref.net$create_user
refnet_anno[7,1] <- ref.net$update_time
refnet_anno[8,1] <- ref.net$update_user
refnet_anno[9,1] <- ref.net$public
refnet_anno[10,1] <- ref.net$organism
refnet_anno[11,1] <- ""
write.table(refnet_anno, paste(refnet_name,".anno",sep = ""), col.names=FALSE, row.names=TRUE, sep="\t", quote = FALSE)

netid <- matrix(nrow=length(ref.net$network),ncol=1)

netid[,1]<-c(1:length(ref.net$network))
colnames(netid)<-c("id")
anno<- cbind(netid, ref.net$annotation)
write.table(anno, paste(refnet_name,".anno",sep = ""), col.names=TRUE, row.names=FALSE, sep="\t", quote = FALSE, append=TRUE)


dir.create(refnet_name)
for (i in 1:length(ref.net$network))
{
  # 依次读入net*.graphml
  net<-ref.net$network[[i]]
  # 计算
  nodes <- matrix(nrow=length(V(net)),ncol=1)
  nodes[,1]<- V(net)$name
  write.table(nodes, paste(refnet_name, '/','net',as.character(i),'.nodes',sep=""), col.names=FALSE)
  edges <- matrix(nrow=length(E(net)),ncol=2)
  edges <- get.edgelist(net)
  write.table(edges, paste(refnet_name, '/','net',as.character(i),'.edges',sep=""), col.names=FALSE)
}