getOptValue <- function(option,algorithm,parameters){
        return(option[option$algorithm == algorithm & option$parameters == parameters,3])
}

checkOptValue <- function(option){
        stopifnot (getOptValue(option,"NFP","algorithm") %in% c("APCLUSTER","GHOST","SPINAL","ISORANK"))
        stopifnot (getOptValue(option,"NFP","sim") %in% c("sequence","geneontology"))
        stopifnot (getOptValue(option,"NFP","nperm") %in% c("10","100","1000"))
        stopifnot (getOptValue(option,"ISORANK","K") %in% c("10","20","30"))
        stopifnot (getOptValue(option,"ISORANK","thresh") %in% c("0.001","0.0001","0.00001"))
        stopifnot (getOptValue(option,"ISORANK","alpha") %in% c("0.2","0.4","0.6","0.8","1"))
        stopifnot (getOptValue(option,"ISORANK","beta") %in% c("0.25","0.5","0.75"))
        stopifnot (getOptValue(option,"ISORANK","maxveclen") %in% c("200000","1000000","5000000")) # xwj 2015/12/16
        stopifnot (getOptValue(option,"GHOST","hops") %in% c("2","4","6"))
        stopifnot (getOptValue(option,"GHOST","nneighbors") %in% c("-1","0","5","10"))
        stopifnot (getOptValue(option,"GHOST","searchiter") %in% c("5","10","15"))
        stopifnot (getOptValue(option,"GHOST","ratio") %in% c("4","6","8","10"))
        stopifnot (getOptValue(option,"APCLUSTER","q") %in% c(NA,"0","0.3","0.7","1"))
        stopifnot (getOptValue(option,"APCLUSTER","maxits") %in% c("10","100","1000"))
        stopifnot (getOptValue(option,"APCLUSTER","convits") %in% c("50","100","150"))
        stopifnot (getOptValue(option,"APCLUSTER","lam") %in% c("0.5","0.6","0.7","0.8","0.9","1"))
        stopifnot (getOptValue(option,"APCLUSTER","nonoise") %in% c("FALSE","TRUE"))
        print("option check passed!")
}

#真实算法
# -----------FUNCTION Definition STARTS HERE --------------------------
# filter the input net with GOannotation, keep the ignored seperately
subgraph_with_GOannotation <- function(net){
#  if(!(exists('geneSimData') && typeof(geneSimData) == "double"))
#    data(geneSimData)
#  load("../refnet/geneSimData.rdata")
  node_index <- V(net)$name %>% match(row.names(geneSimData),nomatch = 0)
  node_with_GO <- row.names(geneSimData)[node_index]
  
  ignored <- V(net)$name %>% match(.,node_with_GO) %>% is.na 
  node_ignored <- V(net)$name[ignored] 
  
  if(length(node_ignored) != 0){
    print(paste(length(node_ignored),"nodes without GO annotation are ignored!"))
    return(list(net = induced.subgraph(net,node_with_GO),
                node_ignored = node_ignored))
 }
  else
    return(list(net = net,node_ignored = node_ignored))
}


# generate one random net
randomize_net <- function(net){
  if (ecount(net) < (length(V(net))*(length(V(net))-1))){
    net <- rewire(net, keeping_degseq(niter = gsize(net) * 4))   
  }
  
  genes <- row.names(geneSimData)
  index <-  genes %>% length %>% sample(length(V(net)))
  new_node <- genes[index]
  V(net)$name <- new_node
  return(net)
}

node_cluster_index <- function(APResult){
  
  node_cluster_index <- c()
  node_cluster_names <- c()
  APResult %>% print # DEBUG xwj 2015/12/05
  for (i in 1:length(APResult@clusters)){
    node_cluster_index[APResult@clusters[[i]]] <- i
    node_cluster_names[APResult@clusters[[i]]] <- names(APResult@clusters[[i]])
  }
  
  names(node_cluster_index) <- node_cluster_names
  return(node_cluster_index)
}# moved here by xwj 2015/12/05

calc_cluster_score <- function(cluster,node1,node2){
  v1 <- intersect(names(node1),names(cluster))
  v2 <- intersect(names(node2),names(cluster))
  index1 <- match(v1,row.names(geneSimData),nomatch = 0)
  index2 <- match(v2,row.names(geneSimData),nomatch = 0) ## same as setdiff(cluster,index1)
  if (length(index1) && length(index2)){
    LS1 <- sapply(index1,function(x)max(geneSimData[x,index2])) %>% sum
    LS2 <- sapply(index2,function(x)max(geneSimData[x,index1])) %>% sum
    LS <- (LS1 + LS2)/(length(index1)+length(index2))
  }
  else
    LS <- 0
  return(LS)
}# moved here by xwj 2015/12/05

# Define a new function to calculate score for ghost, spinal and isorank.
# NOT FOR APcluster to use!!!!! 
clusters_to_score_and_index <-function(clusters,sub_net1,sub_net2){
  
 # wrong raw_score because unmapped nodes (within sub_net$net but unmapped during cluster)i
 # are not counted as clusters 
 
  net1_cluster_index <- seq(1,length(clusters[,1]))
  names(net1_cluster_index) <- clusters[,1]
  
  net2_cluster_index <- seq(1,length(clusters[,2]))
  names(net2_cluster_index) <- clusters[,2]
  
  net1_unclustered <- V(sub_net1$net)$name %>% match(.,clusters[,1]) %>% is.na %>% V(sub_net1$net)$name[.]
  net2_unclustered <- V(sub_net2$net)$name %>% match(.,clusters[,2]) %>% is.na %>% V(sub_net2$net)$name[.]
  
  net1_node_unclustered <- rep(-1,length(net1_unclustered))
	names(net1_node_unclustered) <- net1_unclustered
  net2_node_unclustered <- rep(-1,length(net2_unclustered))
	names(net2_node_unclustered) <- net2_unclustered

  net1_node_ignored <- rep(0,length(sub_net1$node_ignored))
  names(net1_node_ignored) <- sub_net1$node_ignored
  
  net2_node_ignored <- rep(0,length(sub_net2$node_ignored))
  names(net2_node_ignored) <- sub_net2$node_ignored
  
  # add unmapped nodes back 
  net1_cluster_index <- c(net1_cluster_index, net1_node_unclustered, net1_node_ignored)                      
  net2_cluster_index <- c(net2_cluster_index, net2_node_unclustered, net2_node_ignored)    
  #

  net1_node_index<- clusters[,1] %>% match(row.names(geneSimData),nomatch = 0)
  net2_node_index<- clusters[,2] %>% match(row.names(geneSimData),nomatch = 0)
	 
  score_of_cluster <- sapply(1:length(clusters[,1]),
                             function(x) geneSimData[net1_node_index[x],net2_node_index[x]]) %>% unlist
  raw_score <- (length(net1_unclustered) + length(net2_unclustered)) %>% 
		rep(0,.) %>% c(score_of_cluster,.) %>% mean 
  # raw_score <- score_of_cluster %>% mean
 #   
  print(raw_score)
  #writeLines(raw_score,fileConn)
  return(list(raw_score = raw_score, 
              net1_cluster_index = net1_cluster_index,
              net2_cluster_index = net2_cluster_index,
              score_of_cluster = score_of_cluster)
  )
}

# standardize the similarity score
# random_score_nperm <- function(net,refnet,nperm,...){
#   calc_random_score <- function(net,refnet,...){
#     random_net <- randomize_net(refnet)
#     random_score <- calc_twonet_score(net,random_net)
#     return(random_score[[1]])
#   }
#   random_score_nperm <- replicate(nperm,calc_random_score(net,refnet),simplify = FALSE)
#   return(random_score_nperm)
# }
# two net sim score 
calc_twonet_score_apcluster <- function(net1,net2,...){
#  xwj 2015/12/05 modified a lot in this function to speed up this function
#  xwj 2015/12/05 V_sub_net1 replaced V(sub_net1$net) to speed up this function
#  xwj 2015/12/05 two internal functions(node_cluster_index and calc_cluster_score) moved out of calc_twonet_score_apcluster
  
  # process net1 and net2; also return ignored nodes
	sub_net1 <- net1 %>% subgraph_with_GOannotation
	sub_net2 <- net2 %>% subgraph_with_GOannotation
  
  V_sub_net1 <- V(sub_net1$net) # xwj 2015/12/05
	V_sub_net2 <- V(sub_net2$net) # xwj 2015/12/05
	
  # merge net1 and net2
	node_index <- c(V_sub_net1$name,V_sub_net2$name) %>% #xwj 2015/12/05 
    	match(row.names(geneSimData),nomatch = 0)
  	gene_sim <- geneSimData[node_index,node_index]
  
  lo=1
  hi=length(V_sub_net1)#xwj 2015/12/05 
  
  gene_sim[lo:hi, lo:hi] <- gene_sim[lo:hi, lo:hi] * as.matrix(as_adj(sub_net1$net))
  ## ?? do the transpose matrix or not?
  
  lo= length(V_sub_net1) + 1#xwj 2015/12/05 
  hi= length(V_sub_net1) + length(V_sub_net2)#xwj 2015/12/05 
  gene_sim[lo:hi, lo:hi] <- gene_sim[lo:hi, lo:hi] * as.matrix(as_adj(sub_net2$net)) #xwj 2015/12/05 
  
  #writeLines("gene_sim maxtrix is ready.", fileConn)
  APResult <- apcluster(s = gene_sim, 
			q = getOptValue(option,"APCLUSTER","q") %>% as.numeric,
			maxits = getOptValue(option,"APCLUSTER","maxits") %>% as.numeric,
			convits = getOptValue(option,"APCLUSTER","convits") %>% as.numeric,
			lam = getOptValue(option,"APCLUSTER","lam") %>% as.numeric,
			nonoise = getOptValue(option,"APCLUSTER","nonoise") %>% as.logical)
  print("two nets apcluster step complete")
  #writeLines("apcluster step finished.",fileConn) 
  # nodes in clusters is named with entrez id
#   node_cluster_index <- function(APResult){
# 
#     node_cluster_index <- c()
#     node_cluster_names <- c()
#     for (i in 1:length(APResult@clusters)){
#       node_cluster_index[APResult@clusters[[i]]] <- i
#       node_cluster_names[APResult@clusters[[i]]] <- names(APResult@clusters[[i]])
#     }
# 
#     names(node_cluster_index) <- node_cluster_names
#     return(node_cluster_index)
#   } # move out as global functions by xwj 2015/12/05 
  
  node_cluster_index_all <- APResult %>% node_cluster_index
  print("cluster info extracted")
  # split cluster result into two nets
  net1_node_ignored <- rep(0,length(sub_net1$node_ignored))
  names(net1_node_ignored) <- sub_net1$node_ignored

  net2_node_ignored <- rep(0,length(sub_net2$node_ignored))
  names(net2_node_ignored) <- sub_net2$node_ignored
  
  # add unmapped nodes back
  net1_cluster_index <- node_cluster_index_all %>% names %>%
    match(V_sub_net1$name,.) %>%
    node_cluster_index_all[.]
  net1_cluster_index <- c(net1_cluster_index, net1_node_ignored)

  net2_cluster_index <- node_cluster_index_all %>% names %>%
    match(V_sub_net2$name,.) %>%
    node_cluster_index_all[.]
  net2_cluster_index <- c(net2_cluster_index, net2_node_ignored)
  #
	print("cluster info processed")
  
  #cluster score : this function is only for APcluster option
#   calc_cluster_score <- function(cluster,node1,node2){
#     v1 <- intersect(names(node1),names(cluster))
#     v2 <- intersect(names(node2),names(cluster))
#     index1 <- match(v1,row.names(geneSimData),nomatch = 0)
#     index2 <- match(v2,row.names(geneSimData),nomatch = 0) ## same as setdiff(cluster,index1)
#     if (length(index1) && length(index2)){
#       LS1 <- sapply(index1,function(x)max(geneSimData[x,index2])) %>% sum
#       LS2 <- sapply(index2,function(x)max(geneSimData[x,index1])) %>% sum
#       LS <- (LS1 + LS2)/(length(index1)+length(index2))
#     }
#     else
#       LS <- 0
#     return(LS)
#   } ## move out as global functions by xwj 2015/12/05 
  
  score_of_cluster <-   sapply(1:length(APResult),
                               function(x)
                                 calc_cluster_score(APResult[[x]],
                                                    V_sub_net1,V_sub_net2))#xwj 2015/12/05 
  
  raw_score <- score_of_cluster %>% mean
  print("two net apcluster: score returned")
  #writeLines("score returned", fileConn)
  return(list(raw_score = raw_score,
              net1_cluster_index = net1_cluster_index,
              net2_cluster_index = net2_cluster_index,
              score_of_cluster = score_of_cluster)
  )
}
calc_twonet_score_ghost <- function(net1,net2, ...){
  
  igraph_to_net_ghost <- function(net,outputname,...){
    netedgelist <- net %>% as_edgelist
    fileConnGHOST <-file(paste0("./",outputname,".net"),"w+")
    writeLines(sprintf("%s %s",vcount(net),ecount(net)),fileConnGHOST)
    for (i in 1:vcount(net)){
      writeLines(sprintf("%s",V(net)$name[i]),fileConnGHOST)
    }
    for (i in 1:ecount(net)){
      writeLines(sprintf("%s %s",netedgelist[i,1],netedgelist[i,2]),fileConnGHOST)
    }
    close(fileConnGHOST)
  } 
  

  print("two net ghost: start") 
  homedir<-getwd()
  setwd("/root/NFPportable/temp")	
  jobID<- strsplit(homedir,"Report")[[1]][2]
  system(paste0("mkdir ",jobID))
  print("jobID folder created")
  print(jobID)
  # process net1 and net2; also return ignored nodes
        sub_net1 <- net1 %>% subgraph_with_GOannotation
        sub_net2 <- net2 %>% subgraph_with_GOannotation
  
  igraph_to_net_ghost(sub_net1$net,paste0(jobID,"/net1"))
  igraph_to_net_ghost(sub_net2$net,paste0(jobID,"/net2"))
  
  # Call ghost scripts start here. input and output in homedir
  cfgfile <-file(paste0(jobID,"/ghost.cfg"),"w+")
  writeLines("[main]",cfgfile)
  writeLines(paste0("network1: ./",jobID,"/net1.net"),cfgfile)
  writeLines(paste0("network2: ./",jobID,"/net2.net"),cfgfile)	

  #writeLines("sequencescores: ../ghost/entrez-entrez_from_isorank.evals",cfgfile)
   
  writeLines(paste0("sequencescores: ../refnet/",getOptValue(option,"NFP","sim"),"Data.evals"),cfgfile)
  
  writeLines(paste("hops:",getOptValue(option,"GHOST","hops")),cfgfile)
  writeLines(paste("nneighbors:",getOptValue(option,"GHOST","nneighbors")),cfgfile) 
  writeLines(paste("searchiter:",getOptValue(option,"GHOST","searchiter")),cfgfile)
  writeLines(paste("ratio:",getOptValue(option,"GHOST","ratio")),cfgfile) 
  close(cfgfile)
  
  #system("export LD_LIBRARY_PATH=../ghost/boost")
  #system(paste0("../ghost/GHOST -c ./",jobID,"/ghost.cfg"))
  system(paste("sh ../ghost/ghost.sh",jobID))
 ##ghost scripts end here, output a file at the current dir.
  ghost_clusters <- read.table("./net1_vs_net2.af", header = FALSE)
  system("rm ./net1_vs_net2.af")
  print("two net ghost: score returned. ")
  setwd(homedir)
  clusters_to_score_and_index(ghost_clusters,sub_net1,sub_net2) %>% return
}# FOR GHOST twonet
calc_twonet_score_spinal <- function(net1,net2,option,...){
  
  homedir <- getwd()
  setwd("/root/NFPportable/temp")	
  sub_net1 <- net1 %>% subgraph_with_GOannotation
  sub_net2 <- net2 %>% subgraph_with_GOannotation
  jobID<- strsplit(homedir,"Report")[[1]][2]
  system(paste0("mkdir ",jobID))
  print("jobID folder created")
  print(jobID)
  sub_net1$net %>% as_edgelist %>% write.table(.,file = paste0(jobID,"/net1.tab"))
  sub_net2$net %>% as_edgelist %>% write.table(.,file = paste0(jobID,"/net2.tab"))
  print("two net spinal: start")
  #system(paste("cp net1.tab net2.tab ../spinal/data/hsapi"),intern = TRUE)
  system(paste0("rm -r ../spinal/data/hsapi/",jobID))
  system(paste0("mv ", jobID, " ../spinal/data/hsapi/"),intern = TRUE)
  setwd("../spinal")

  # pythonscripts here 
  #system("sh ./spinal.sh")
  #system("sed 's/\"//g' ./data/hsapi/net1.tab | awk '{print $2,$3}' | grep -v V2 > ./data/hsapi/net1_clean.tab", intern = TRUE)
  system(paste0("sed 's/\"//g' ./data/hsapi/",jobID,"/net1.tab | awk '{print $2,$3}' | grep -v V2 > ./data/hsapi/",jobID,"/net1_clean.tab"))
  system(paste0("sed 's/\"//g' ./data/hsapi/",jobID,"/net2.tab | awk '{print $2,$3}' | grep -v V2 > ./data/hsapi/",jobID,"/net2_clean.tab"))
  system(paste0("python ./pyscripts/data_generation.py ./data/hsapi/",jobID,"/net1_clean.tab ./data/hsapi/",jobID,"/net2_clean.tab ../refnet/",
		getOptValue(option,"NFP","sim"),
		"Data.evals"))
  system(paste0("./spinal.exe -II -ns ./data/hsapi/",jobID,"/net1_clean.tab.gml ./data/hsapi/",jobID,"/net2_clean.tab.gml ../refnet/",
		getOptValue(option,"NFP","sim"),"Data.evals.pin ./data/hsapi/",jobID,"/net1_net2_spinal.txt ",
		getOptValue(option,"SPINAL","alpha")))
  system(paste0("python ./pyscripts/spinal_original_names.py ./data/hsapi/",jobID,"/net1_clean.tab.gml ./data/hsapi/",jobID,"/net2_clean.tab.gml ./data/hsapi/",jobID,"/net1_net2_spinal.txt ./data/hsapi/",jobID,"/net1_net2_spinal_originalname.txt"))
  #   # export cluster results
  system(paste0("cat ./data/hsapi/",jobID,"/net1_net2_spinal_originalname.txt | grep -v ! > ./data/hsapi/",jobID,"/net1_net2_spinal_cluster.txt"))
  #   # system() command end here, switch to R
  spinal_clusters <- read.table(paste0("./data/hsapi/",jobID,"/net1_net2_spinal_cluster.txt"),header =FALSE)
  setwd(homedir)
  print("two net spinal: score returned")
 
  clusters_to_score_and_index(spinal_clusters,sub_net1,sub_net2) %>% return
}# FOR SPINAL twonet
calc_twonet_score_isorank <- function(net1,net2,...){
  
  igraph_to_net_isorankN2 <- function(net,prefix,...){
    netedgelist <- net %>% as_edgelist
    fileConnISORANK <-file(paste0("./",prefix,".tab"),"w+")
    writeLines(sprintf("INTERACTOR_A INTERACTOR_B"),fileConnISORANK)
    for (i in 1:ecount(net)){
      writeLines(sprintf("%s %s",
                         paste0(prefix,netedgelist[i,1]),
                         paste0(prefix,netedgelist[i,2])),fileConnISORANK)
    }
    close(fileConnISORANK)
  } 
  
  evals_generation <- function(net1,net2,prefix1,prefix2){
        net1_index <- V(net1)$name %>% match(.,row.names(geneSimData),nomatch = 0)
  	net2_index <- V(net2)$name %>% match(.,row.names(geneSimData),nomatch = 0)
  	net1graph <- geneSimData[net1_index,net1_index] %>% 
     		graph_from_adjacency_matrix(., mode = "undirected",add.rownames = TRUE, weighted = TRUE)
        net2graph <- geneSimData[net2_index,net2_index] %>% 
    		graph_from_adjacency_matrix(., mode = "undirected",add.rownames = TRUE, weighted = TRUE)
  	net1edgelist <- net1graph %>% as_edgelist
  	net2edgelist <- net2graph %>% as_edgelist
  	net1edgeattr <- net1graph %>% edge_attr(.,"weight")
  	net2edgeattr <- net2graph %>% edge_attr(.,"weight")
  
  	net12graph <- geneSimData[net1_index,net2_index]
  
  	fileConn <- file(paste0("./",prefix1,"-",prefix1,".evals"),"w+")
  	for (i in 1:length(net1edgeattr)){
    	writeLines(sprintf(paste0(prefix1,"%s ",prefix1,"%s %s"),
                       net1edgelist[i,1],net1edgelist[i,2],
                       net1edgeattr[i]),fileConn)
    	print(i)
  	}
  	close(fileConn) # output C-C.evals
  	fileConn <- file(paste0("./",prefix2,"-",prefix2,".evals"),"w+")
  	for (i in 1:length(net2edgeattr)){
    	writeLines(sprintf(paste0(prefix2,"%s ",prefix2,"%s %s"),
                       net2edgelist[i,1],net2edgelist[i,2],
                       net2edgeattr[i]),fileConn)
    	print(i)
  	}
  	close(fileConn) # output D-D.evals

  	node1 <- net12graph %>% rownames
  	node2 <- net12graph %>% colnames
  	fileConn <- file(paste0("./",prefix1,"-",prefix2,".evals"),"w+")
  	for (i in 1:(node1 %>% length)){
    		for(j in 1:(node2 %>% length)){
      		writeLines(sprintf(paste0(prefix1,"%s ",prefix2,"%s %s"),
                         node1[i],node2[j],
                         net12graph[i,j]),
        	         fileConn)
    		}
    		print(i)  
 	 }	
  	close(fileConn)
  }

  homedir <- getwd()
  setwd("/root/NFPportable/temp")	
  
  jobID<- strsplit(homedir,"Report")[[1]][2]
  system(paste0("mkdir ",jobID))
  print("jobID folder created")
  print(jobID)
  setwd(jobID)
  sub_net1 <- net1 %>% subgraph_with_GOannotation
  sub_net2 <- net2 %>% subgraph_with_GOannotation
   
  igraph_to_net_isorankN2(sub_net1$net,"C")
  igraph_to_net_isorankN2(sub_net2$net,"D")
  evals_generation(sub_net1$net,sub_net2$net,"C","D")
#igraph_to_net_isorankN2(sub_net1$net,paste0(jobID,"/C"))
  #igraph_to_net_isorankN2(sub_net2$net,paste0(jobID,"/D"))
  print("two net isorank: start")
  #system(paste0("cp ",jobID,"/C.tab ",jobID,"/D.tab ../isorank"))
  #setwd("../isorank")
  system("cp ../../isorank/data.inp .")
  #system("cp ../../isorank/*.evals .")
	 if (getOptValue(option,"ISORANK","thresh") == "0.001") thresh <- "1e-3"
	 else if (getOptValue(option,"ISORANK","thresh") == "0.0001") thresh <- "1e-4"
	 else if (getOptValue(option,"ISORANK","thresh") == "0.00001") thresh <- "1e-5"
	 else stop("wrong option:ISORANK thresh")
	 #if 
         #else if (getOptValue(option,"ISORANK","maxveclen") == "200k") maxveclen <- "200000"
	 #else if (getOptValue(option,"ISORANK","maxveclen") == "1000k") maxveclen <- "1000000"
	 #else if (getOptValue(option,"ISORANK","maxveclen") == "5000k") maxveclen <- "5000000"
	 #else stop("wrong option:ISORANK maxveclen")
         maxveclen <- getOptValue(option,"ISORANK","maxveclen")
  print(option)
  system(paste("../../isorank/isorank-n2  --K",getOptValue(option,"ISORANK","K"),"--thresh",thresh,"--alpha", getOptValue(option,"ISORANK","alpha"),"--maxveclen",maxveclen,"data.inp --prefix C_D"))
  print(paste("../../isorank/isorank-n2  --K",getOptValue(option,"ISORANK","K"),"--thresh",thresh,"--alpha", getOptValue(option,"ISORANK","alpha"),"--maxveclen",maxveclen,"data.inp --prefix C_D"))
  cat("isorank step 1 and 2 passed")

  system(paste("../../isorank/isorank-n2  --K",getOptValue(option,"ISORANK","K"),"--thresh",thresh,"--alpha", getOptValue(option,"ISORANK","alpha"),"--beta", getOptValue(option,"ISORANK","beta"), "--maxveclen",maxveclen,"--scorefile C_D_match-score.txt --readstar --o final_cluster.txt data.inp"))
  # isorankN2 finished ->> output a file at the current dir.
  # 1st column is D, 2nd colum is C, which is opposite. 
  # isorankN2_clusters <- read.table("./output_cluster.txt", header = FALSE)
  	fileConn <- file("./final_cluster.txt")
	output_cluster <- readLines(fileConn)
	close(fileConn)
	isorankN2_clusters <- c()
 	for (i in 1:length(output_cluster)){
  	temp_nodes <- strsplit(output_cluster[i],split = " ") %>% unlist
  	nodes_from_net1 <- temp_nodes %>% grep("C",.) %>% temp_nodes[.] 
  	nodes_from_net2 <- temp_nodes %>% grep("D",.) %>% temp_nodes[.]
 	 for (j in 1:length(nodes_from_net1)){
    		for (k in 1:length(nodes_from_net2)){
 	     		isorankN2_clusters <- rbind(isorankN2_clusters,
                                  c(nodes_from_net1[j],nodes_from_net2[k]))   
   	 		}
  		}
	}
  isorankN2_clusters <- gsub("[CD]","",isorankN2_clusters) 
  #system("sed 's/[CD]//g' final_cluster.txt | awk '{print $1,$2}' > output_cluster.txt") 
  system("rm *.evals stars* data.inp")
  setwd(homedir)
  print("two net isorank: score returned")
  #writeLines("isorank step finished",fileConn)
  clusters_to_score_and_index(isorankN2_clusters,sub_net1,sub_net2) %>% return 
  
}# FOR isorank twonet

calc_twonet_sim_score<- function (net1,net2,option, homedir,fileConn ){
  
  algorithm <- getOptValue(option,"NFP","algorithm")
  counter <<- counter +  1
  print(paste("Working in refnet # ",counter,"with",algorithm))
# print(fileConn)
  writeLines(paste("Refnet",counter), fileConn)
  
  if (algorithm == "APCLUSTER"){
    print("APCLUSTER")
    print(option)
    raw_score_list <- calc_twonet_score_apcluster(net1,net2,option)
# skip random by xwj 2015/12/05
    random_net <- replicate(getOptValue(option,"NFP","nperm"),
 			    randomize_net(net2),simplify = FALSE)
 
     random_score_nperm <- llply(random_net,
                                 function(x)
                                 {calc_twonet_score_apcluster(net1,x,option) %>% .[[1]]}) %>% unlist
# add random back by xwj 2015/12/29
  }
  else if (algorithm == "GHOST"){
    print("GHOST")
    raw_score_list <- calc_twonet_score_ghost(net1,net2,option)
     random_net <- replicate(getOptValue(option,"NFP","nperm"),
                             randomize_net(net2),simplify = FALSE)
     random_score_nperm <- llply(random_net,
                                 function(x)
                                 {calc_twonet_score_ghost(net1,x,option) %>% .[[1]]}) %>% unlist
# add random back by xwj 2015/12/29
  }
  else if (algorithm == "SPINAL"){
    print("SPINAL")
    raw_score_list <- calc_twonet_score_spinal(net1,net2,option)
     random_net <- replicate(getOptValue(option,"NFP","nperm"),
                             randomize_net(net2),simplify = FALSE)
 
     random_score_nperm <- llply(random_net,
                                 function(x)
                                 {calc_twonet_score_spinal(net1,x,option) %>% .[[1]]}) %>% unlist
  }
  else if (algorithm == "ISORANK"){
    print("ISORANK")
    raw_score_list <- calc_twonet_score_isorank(net1,net2,option)
     random_net <- replicate(getOptValue(option,"NFP","nperm"),
                             randomize_net(net2),simplify = FALSE)
 
     random_score_nperm <- llply(random_net,
                                 function(x)
                                 {calc_twonet_score_isorank(net1,x,option) %>% .[[1]]}) %>% unlist
#     xwj 2015/12/05
  }
  else  {
	print(algorithm)
	close(fileConn)
	stop("Incorrect algorithm selected. Abort")
  }
 
  standardized_score <- (raw_score_list[[1]] - mean(random_score_nperm))/sd(random_score_nperm) 
# add back random step by xwj 2015/12/29  
# standardized_score <- raw_score_list[[1]]
#   print(standardized_score)
#   print(raw_score_list$net1_cluster_index)
#   print(raw_score_list$net2_cluster_index)
#   print(raw_score_list$score_of_cluster)
  return(list(standardized_score = standardized_score,
              net1_cluster_index = raw_score_list$net1_cluster_index,
              net2_cluster_index = raw_score_list$net2_cluster_index,
              score_of_cluster = raw_score_list$score_of_cluster)
  )
}

# MAIN 
calc_sim_score_main <- function(net, refnet,option, homedir){
  
  fileConn <-file(paste0("./",date() %>% gsub(":| ","_",.),
			deparse(substitute(net)),"_vs_",deparse(substitute(refnet)),".txt"),"w+")
  write.table(option,fileConn) 
  checkOptValue(option) # make sure option is correct 
  if (getOptValue(option,"NFP","sim") == "geneontology"){
	if(!(exists('GeneontologyData') && typeof(GeneontologyData) == "double"))
  		load("/root/NFPportable/refnet/GeneontologyData.rdata")	
	geneSimData <<- GeneontologyData
	print("geneontologyData loaded.")
	writeLines("geneontologyData loaded.",fileConn)	
  }
  else if (getOptValue(option,"NFP","sim") == "sequence"){
	if(!(exists('SequencescoreData') && typeof(SequencescoreData) == "double"))
  		load("/root/NFPportable/refnet/SequencescoreData.rdata")  #revise by summ
	geneSimData <<- SequencescoreData 
	print("SequencescoreData loaded.")
  	writeLines("SequencescoreData loaded.",fileConn)
  }
  else {
	close(fileConn)
	stop("Wrong  similarity is chosen. No such a data file. Abort")
  }   
  querynet <- net
  refnetlist <- refnet$network
  print("START!")
  counter <<- 0
# print(getOptValue(option,"APCLUSTER","lam")) # xwj 2015/12/04 debug purpose
  result <- llply(refnetlist,function(x) calc_twonet_sim_score(querynet,x,option, homedir, fileConn))
  print("Raw scores: complete")
  sim_score <- llply(result,function(x) x[[1]]) %>% unlist
  querynetnode_cluster_index <- llply(result, function(x) x[[2]])
  refnetnode_cluster_index <- llply(result, function(x) x[[3]])
  score_of_cluster <- llply(result, function(x) x[[4]])
  print("NFP scores:")
  writeLines(paste("NFP",sim_score), fileConn)
  rm(counter)
  rm(geneSimData)
  close(fileConn)
  print(sim_score)

  return(list(nfp = sim_score,
              querynetnode_cluster_index = querynetnode_cluster_index,
              refnetnode_cluster_index = refnetnode_cluster_index,
              score_of_cluster = score_of_cluster)
  )
}
# FUNCTION Definition END HERE!
