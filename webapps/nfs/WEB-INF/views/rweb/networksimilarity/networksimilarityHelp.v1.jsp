<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
        <title>Network Fingerprint Scanner</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="static/image/w1.png" />
    <!-- Bootstrap core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional Bootstrap Theme -->
    <link href="data:text/css;charset=utf-8," data-href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" rel="stylesheet" id="bs-theme-stylesheet">
    <!-- Documentation extras -->
   	<link href="static/css/docs.min.css" rel="stylesheet">		
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">
		<link href="rweb/css/comment.css" rel="stylesheet">	
		<link href="rweb/css/header1.css"  type="text/css" rel="stylesheet">
		<link href="static/css/help.css"  type="text/css" rel="stylesheet">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/climacons-font.css" rel="stylesheet">
		<script>
			if (!!window.ActiveXObject || "ActiveXObject" in window || navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 || (navigator.userAgent.split(";")[1].toLowerCase().indexOf("safari") > 0 && navigator.userAgent.split(";")[1].toLowerCase().indexOf("chrome") < 0)){
				alert("A problem with your browser\n You are using a very old version of Internet Explorer.\n We recommend you upgrade to an alternative browser than Internet Explorer.");
			}
		</script>
    <style>
    </style>
</head>
<body>
					<div class="container">
			<!-- Header -->
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">
				
				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							<center><img src="static/image/b2.png" style="width: 110px;margin-top: -20px;margin-right: -20px;"/>
							<span style="color:white;font-size:33px;margin-top: 1px;">Network Fingerprint Scanner</span> 
							<span style="color: white; font-size: 15px; top: 28px; margin-left: 5px;">NFS：a server for knowledge-based characterization of biomedical networks
</span> <span style="position:absolute;right:10;top:6;display: none;" >
								<c:choose>
									<c:when test="${sessionScope.username != null}">
										<button type="button" class="btn btn-primary" id="btn-user"><i class="fa fa-user"></i> <%=session.getAttribute("username") %></button>
										<button type="button" class="btn btn-primary" onclick="logout()" id="btn-out"><i class="fa  fa-user-md"></i> Log Out</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary" id="btn-login" data-toggle="modal" data-target="#loginModal"><i class="fa fa-lightbulb-o"></i> Login</button>
										<button type="button" class="btn btn-primary" id="btn-signup" data-toggle="modal" data-target="#signupModal"><i class="fa  fa-user-md"></i> Sign Up</button>
									</c:otherwise>
								</c:choose>
							</span> 
					</div>
					
				</div>
				<!-- /Main Header -->
				
				<!-- Lower Header -->
				<div id="lower-header">
					
					<div class="container">
					
					<div id="menu-button">
						<div>
						<span></span>
						<span></span>
						<span></span>
						</div>
						<span>Menu</span>
					</div>
					
					<ul id="navigation" style="">
						
						
						<!-- Home -->
						<li class="">
						
							<a class="fa " href="networksimilarityHome">Home</a>
							
							
						</li>
						<!-- /home -->
						
						<!-- Events -->
						<li  style="width: 300px;">
							<a class="fa  " href="networksimilarityAnalysis?type=1">Network Fingerprint Scan</a>
						</li>
						<li style="width: 250px;">
							<a class="fa  " href="networksimilarityAnalysis?type=2">Pairwise Alignment</a>
						</li>
				
						
						<!-- /Events -->
						
						<!-- Media -->
						<!-- /Media -->
						
						
						
						
						<!-- Features -->
						<li>
							<a class="fa " href="networksimilaritystatistical">Resource</a>
							<c:choose>
								<c:when test="${sessionScope.username != null}">
									<ul>
										<li><a id="resource1" href="networksimilaritystatistical">Statistics of current release</a></li>
										<li><a id="resource2" href="networksimilarityprofiles">My Profiles</a></li>
									</ul>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</li>
						<!-- /Features -->
						
						
						<!-- Get Involved -->
						<li class="current-menu-item">
							<a class="fa  " href="networksimilarityHelp">Help</a>
							
						</li>
						<!-- /Get Involved -->
						
						
						
						<!-- CONTACT -->
						<li>
								<a class="fa  " href="networksimilarityContact">Contact</a>
						</li>
						<!-- /CONTACT -->
						
					</ul>
					
					</div>
					
				</div>
				<!-- /Lower Header -->
				
				
			</header>
			<!-- /Header -->
			<div >
    <div class="container bs-docs-container" style="">
        <div class="row">
            <div class="col-md-3" role="complementary">
                <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm">
                    <ul class="nav bs-docs-sidenav">
                        <li class="active"><a href="#overviewbodyA" >Overview</a></li>
                        <li><a href="#quickStartbodyA" >Quick Start</a></li>
                        <li><a href="#genelistbodyA">Make a input network from a gene list</a></li>
                        <li><a href="#igraphclassbodyA" >Make a input network from igraph class</a></li>
                        <li><a href="#UploadbodyA" >Upload the input network</a></li>
                        <li><a href="#SetparametersbodyA" >Set parameters</a></li>
                        <li><a href="#librarybodyA" >Choose a set of basic networks from library</a></li>
                        <li><a href="#serverbodyA" >Submit a job to NFS server</a></li>
                        <li><a href="#BookmarkbodyA" >Bookmark result page and retrieve later</a></li>
                        <li><a href="#UnderstandbodyA" >Understand the overview of NFS result</a></li>
                        <li><a href="#ExplorebodyA" >Explore pairwise alignment details of NFS result</a></li>
                        <li><a href="#DownloadbodyA" >Download graphs, tables and PDF report</a></li>
                        <li><a href="#ExpirationbodyA" >Expiration time of result page</a></li>
                        <li><a href="#PairwisebodyA" >Pairwise alignment analysis</a></li>
                        <li><a href="#APIbodyA" >Use NFS with RESTful API</a></li>
                        <li><a href="#DisclaimerbodyA" >Disclaimer</a></li>
                        <li><a href="#CopyrightbodyA" >Copyright</a></li>
                        <li><a href="#AcknowledgementbodyA" >Acknowledgement</a></li>
                        <li><a href="#faqbodyA" >FAQ</a></li>
                        <li><a href="#citationbodyA" >Citation</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-7" role="main">
                <div class="bs-docs-section">
                        <div id="overviewbodyA"  class="titleIndex h1">Overview</div>
                        <div class="contentIndex">
Network Fingerprint Scanner (NFS) is a web server to decipher biomedical networks by making systematic comparisons to well-studied basic networks. The similarity is measured by conservations of protein-protein interactions (PPI), sequence and functional annotations. A given biomedical network is characterized as a spectrum-like vector called “network fingerprint”, which contains similarities to basic networks. This knowledge-based multidimensional characterization provides an intuitive way to decipher molecular networks, especially for large-scale network comparison and clustering analyses. 
There are two services provide by NFS webserver. <br>

<h3>1)  “Network Fingerprint Scan” analysis  </h3>
In this workflow, users prepare input networks, upload at most five input networks to NFS server, selected one set of basic networks from resource library, and run this analysis to extract fingerprints of input networks. You can export the results as txt, images and pdf. For example, if you study two types of diabetes, Type 1 diabetes mellitus (T1DM) and Type 2 diabetes mellitus (T2DM). Although two diseases are both characterized by hyperglycaemia, you would like to find the network characteristics underneath their well-known different pathogenesis. Or if you study Alzheimer’s Disease (AD) genetic interaction network in two tissues, entorhinal cortex atrophy (EC) and hippocampal atrophy (HIP), you would like to the differences of pathway enrichments. <a>(Meda et al. Neurobiology of Aging, 链接到citation)</a><br>

<h3>2)  “Pairwise Alignment” analysis </h3>
In this workflow, users prepare two input networks, upload both to NFS server, and run this analysis to generate their network alignments. For example, if you study two types of (TODO)dXXXXXX nci_refnet_signaling[2] [23] /181.<br>

<h3>3)  “Functional Enrichment” analysis </h3>
This is a custom-made graphic tool combined with “Pairwise Alignment” analysis. It categorizes nodes by enriched GO terms or pathways, and highlighted enrichment results in an interactive network graph that allows multi-color demonstrations of genes annotated by different GO terms.<br>

Compare to biomedical networks, some biologist may be more familiar with gene list, which consist of differential expressed genes from RNA-seq and microarray experiments. In fact, gene lists can be easily converted to gene networks by popular tools, such as GeneMania, String, Bioprofiling, Cytoscape-jActiveModules. If you only have gene lists, you can refer to step-by-step guide Make a input network from a gene list and make input networks from gene lists. <br>

If you would like to know more about network fingerprint framework and those integrated network alignment algorithms, please refer to <a href="#citation"> Citation </a>.
                        </div>

                        <div id="start" class="titleIndex h1">Quick Start</div>
                        <div class="contentIndex">
 NFS provides two interactive tutorials explaining the core features of our web server. The tutorials do not cover all features of NFS. Therefore we encourage users to play with the visual elements throughout NFS. Due to demonstration purpose of tutorials, the computation processes (minutes to hours long) will be skipped and the cached results will be immediately return to user. 
<div class="row" style="margin-top:2sem">
<a href="javascript:void(0);" onclick="playtour(1)" class="btn btn-primary col-md-4" style="margin:0.5em"><span class="glyphicon glyphicon-play" aria-hidden="true"></span>&nbsp;Tutorial for Fingerprint Scan</a>
<div class="col-md-7">This tutorial explains how to scan the fingerprints of a small set of networks (up to 5), interpret the results and export the report. </div>
</div>

<div class="row" style="margin-top:2em">
<a href="javascript:void(0);" onclick="playtour(2)" class="btn btn-primary col-md-4" style="margin:0.5em"><span class="glyphicon glyphicon-play " aria-hidden="true"></span>&nbsp;Tutorial for Pairwise Alignment</a>
<div class="col-md-7">
This tutorial explains how to align two networks with NFS, interpret the results and export the report.
</div>
</div>
                        </div>

                        <div id="prepare" class="titleIndex h1">Prepare input networks</div>
                        <div class="contentIndex">
Current version of NFS server support analysis of human gene network. Acceptable gene IDs are Entrez Gene, UniProt/Swiss-Prot, HUGO Gene Symbol, Ensemble ID and acceptable input networks in edgelist and graphml formats. To have good result from NFS, the input networks should have 50 ~ 1000 nodes and 100~1000 edges. Smaller and larger networks are acceptable but not recommended. This section describes how to create input networks. Advanced users, who are familiar with network formats, can skip this section of manuals.
                        </div>


                        <div id="genelistbodyA" class='titleIndex h2'>
1)  Make a input network from a gene list
                        </div>
                         <div class="contentIndex">
Suppose you have a list of genes obtained from RNA-seq, microarray and other high throughput experiments, you make a network out of the gene list with the help of many public servers. For demonstration purposes, we created this section to explain the network generating process on three popular servers. Please follow the data processing steps in any of these alternative options to prepare your input networks. 
                        </div>


                        <div class='titleIndex h3'>
Option #1: GeneMANIA
                        </div>
                         <div class="contentIndex">
GeneMANIA is a user-friendly web server for functional annotations and visualizations of gene list queries. One part of GeneMANIA results is expanded networks based on gene lists. The network file can be exported from GeneMANIA webserver and re-formatted as NFS acceptable network files. The procedure of converting a gene list into a network file with GeneMANIA is described here:<br>
Step 1:<br>
Suppose the list is gene symbols. Open the GeneMANIA page (<a href="http://www.genemania.org" target="_blank">http://www.genemania.org</a>),select species name “H. sapiens(human)”, enter input by typing a list of gene symbols (e.g. MRE11A; RAD51; MLH1 etc.), then click “GO”. <br>
                            <center><img src="static/image/help1.png"/></center>
Step 2: <br>
You are redirected to the result page, visualizing networks with functional annotations. On the menu, click “File” –> “Save network as text” to download the text file to your local disk.<br>
                            <center><img src="static/image/help2.png"/></center>
Step 3: <br>
Then open the downloaded text file, skip the top seven rows and find the two columns under the title “Entity 1” and “Entity 2” (shown in blue box). Copy them and save it in a new text file “net1.edgelist”. This file is in edgelist format and acceptable by NFS webserver. <br>
                            <center><img src="static/image/help3.png"/></center>
                        </div>

                        <div class='titleIndex h3'>
Option #2: BioProfiling.de
                        </div>
                         <div class="contentIndex">
BioProfiling.de is a comprehensive analytical webserver for interpretation of a gene list. Using the PPI spider tool of BioProfiling.de, you are able to convert gene lists into gene networks. The procedure of converting a gene list into a network file with PPI spider/BioProfiling.de is described here:<br>
Step 1:<br>
Open the BioProfiling.de “submit a gene list” page by visiting <a href="http://www.bioprofiling.de/gene_list.html" target="_blank">http://www.bioprofiling.de/gene_list.html</a>.
Prepare an input text file with one gene ID (Entrez Gene, UniProt/Swiss-Prot, HUGO Gene Symbol, etc.) per line, upload the gene list file, select organism “Homo sapiens”, then click “Submit” button. 
                            <center><img src="static/image/help4.png"/></center>
Step 2:<br>
You are directed to the “Main Result Page” which display the job status. The computation of PPI spider usually take a few minutes. The webpage doesn’t refresh automatically, therefore you need to manually refresh the main result page after several minutes. When you see the PPI_spider computation is completed, click “Link to results” in the PPI_spider row. <br>
                            <center><img src="static/image/help5.png"/></center>
Step 3.<br>     
Then you are directed to the “Result:PPI_spider” page, click the “Model_D3.txt” to download the network file. <br>
                            <center><img src="static/image/help6.png"/></center>
Step 4: <br>
Open the Model_D3.txt file, and the top section is “*edges” information. Copy the first two columns of “*edges” section and save as a new text file “net1.edgelist”. This file is in “edgelist” format and acceptable by our NFS webserver.  <br>
                            <center><img src="static/image/help7.png"/></center>
                        </div>
                        <div class='titleIndex h3'>
Option #3: STRING
                        </div>
                         <div class="contentIndex">
STRING is a database of protein-protein interactions, both known and predicted interactions of many organisms. String database can convert your list of genes into a network file. The procedure of converting a gene list into a network file with PPI spider/BioProfiling.de is described here:<br>
Step 1:<br>
Open the String database page at <a href="http://string-db.org" target="_blank">http://string-db.org</a>, switch to “multiple names” tab. Enter a list of gene symbol by uploading a text file or pasting into textbox, select organism “Homo sapiens”. Make sure “the interactors wanted” is “Proteins” then click “GO!” button. <br>
                            <center><img src="static/image/help8.png"/></center>
Step 2:<br>
Next page will display the matched proteins by String database. After you make sure all your protein names are recognized, click “Continue ” button.<br>
                            <center><img src="static/image/help9.png"/></center>
Step 3:<br>
The next page visualizes the network generated from the query gene list. On the menu, click “Save” – “other formats” to open the download option page. <br>
                            <center><img src="static/image/help10.png"/></center>
Step 4:<br>
The download option page shows many available network formats that you can export from STRING. Find “Text Summary” option (TXT –simple tab delimited flatfile). Click “tabdelimited.*****.txt” hyperlink to open it. <br>
                            <center><img src="static/image/help11.png"/></center>
Step 5:<br>
Open the txt file in a text editor, copy and paste the first two columns into a new txt file. In the new txt file, delete the first row “#node1 node2”. Save this new file as “net1.edgelist”. It is in “edgelist” format and acceptable by NFS webserver.<br>
                            <center><img src="static/image/help12.png"/></center>
                        </div>

                        <div class='titleIndex h3'>
Option #5, jactiveModules (TODO)
                         </div>
                         <div class="contentIndex">
(TODO)(http://apps.cytoscape.org/apps/jactivemodules#cy-app-releases-tab) to extract expression activated subnetworks from a molecular interaction network background by jActiveModules. 
                        </div>
                        <div id="igraphclassbodyA" class='titleIndex h2'>
2) Make an input network from other network format
                         </div>
                         <div class="contentIndex">
Some users may work with biomedical networks in other context, and already have network files in different format. It is possible to convert all network formats to NFS acceptable formats. As the length limit, we describe how to export edgelist from Cytoscape and igraph as two examples. 
                        </div>
                        <div class='titleIndex h3'>
Option #1. Cytoscape
                         </div>
                         <div class="contentIndex">
Cytoscape (<a href="http://www.cytoscape.org/" target="_blank">http://www.cytoscape.org/</a>) is popular and integrative platform to visualize biological networks. If you have a network in Cytoscape session and want to analyze your network with NFS, you only need to export the network edges and transform into edgelist form. The procedure is described as follows:<br>
Step 1：<br>
Open the session contain a network, and click “Export Table to File” button on tool panel. <br>
                             <center><img src="static/image/help13.png"/></center>
Step 2: <br>
In the “Export Table” pop-up dialog, select “Network default edge” from dropdown list and click “OK” button.<br>
                            <center><img src="static/image/help14.png"/></center>
Step 3:<br>
In the next dialog window, enter the csv file name and click “OK” button.<br>
                            <center><img src="static/image/help15.png"/></center>
Step 4:
The second column of the csv file contain the edge information. With help of text editors (Notepad, Excel, EmEditor, etc.), you can prepare a tab delaminated “edgelist” for NFS analysis.<br>
                        </div>
                        <div class='titleIndex h3'>
Option 2: igraph
                         </div>
                         <div class="contentIndex">
“igraph” is an efficient and portable network analysis package, which help researchers manipulate networks. Export edgelist (or graphml) network from igraph format can be done with R, python and C/C++. As an example, this section describes how to convert igraph data into NFS server acceptable “edgelist” and “graphml”. <br>
Step 1: <br>
Load the “igraph” library.<br>
Step 2: <br>
Use write_graph commands to export input network as “edgelist” (and “graphml”) file for NFS analysis. <br>
                            <center><img src="static/image/help16.png"/></center>
                        </div>

                        <div id="UploadbodyA" class='titleIndex h1'>
Upload input networks
                         </div>
                         <div class="contentIndex">
This section describes how to upload input networks to NFS server. The procedure of input networks is the same in “Network Fingerprint Scan” and “Pairwise Alignment” analysis. Here the former one is used as an example.<br>
Open the NFS “Home” page, and navigate to “Network Fingerprint Scan” tab. The NFS analysis can extract fingerprint from single or multiple input networks. The format of input networks can be either edge list or graphml format. (Note: If you have gene lists instead of ready-to-use network files, please firstly read the previous two sections “Make an input network from a gene list” and “Make an input network from other network format” and prepare the network files accordingly.) <br>
In the “Input Networks” section, click “upload one network” button, click “Add file” to select input file from local disk, specify ID type, then click “OK” button. Otherwise, enter a network in textbox directly. (TODO 网站文字更新全部完成后重新更改截图内容)<br>
                            <center><img src="static/image/help17.png"/></center>
                            <center><img src="static/image/help18.png"/></center>
Click “Update Network View” button, verify format type and the ID type from dropdown list, then click “OK” button. A network graph is previewed. Now you have successfully uploaded one input network to NFS.<br>
                            <center><img src="static/image/help19.png"/></center>
                            <center><img src="static/image/help20.png"/></center>
Optionally, if you want to scan network fingerprints of more than one networks, just click the “Add another network” button to open more input sections below. Up to five input networks per run are supported by NFS webserver. 
                        </div>

                       <div id="SetparametersbodyA" class='titleIndex h1'>
Set parameters
                         </div>
                         <div class="contentIndex">
This section describes how to set parameters for “Network Fingerprint Scan” analysis and “Pairwise Alignment” analysis. The general parameters is similar in both type of analysis. Here the former one is used as an example. <br>
After input networks are uploaded and previewed successfully, scroll down the webpage to “General Parameters” section. To help users run more productively, the meaning of parameters is explained here. <br>
                            <center><img src="static/image/help21.png"/></center>
                        </div>

                        <div class='titleIndex h2'>
1) Similarity measures between network nodes
                         </div>
                         <div class="contentIndex">
Default setting of similarity measure is “Gene Ontology”, which is based on sematic similarity of GO terms of network nodes. Alternatively, you can also use Sequence blast scores as similarity measure by selecting “Sequence”. Both options are biologically meaningful and useful. However, the network fingerprint of the same input network will be different if different similarity measure is chosen. 
                        </div>

                        <div class='titleIndex h2'>
2) Permutation cycles
                         </div>
                         <div class="contentIndex">
The permutation of basic networks is the necessary step to calculate standardized similarity scores, which rule out the impact of size of reference basic networks. For a basic network, a sample size of 100 randomized networks is recommended to estimate the distribution of similarity scores and standardize similarity scores. The calculation time of 100 permutation cycles on one basic network takes ten minutes on NFS webserver. It is equivalent to say that NFS may run 12 hours to return one network fingerprint if KEGG signaling pathways (contain 108 basic networks). However, 10 permutation cycles will reduce to a couple of hours for the above job. The estimated running time is summarized in following table. We encourage for all users to run initial run with the default setting “10”. After you evaluate the initial result, run 100 or 1000 permutation cycles when necessary. 
                            <table class="table">
                               <caption>Estimated running time in different permutation cycles</caption>
                               <thead>
                                  <tr>
                                     <th>Permutation cycles</th>
                                     <th>Mode</th>
                                     <th>Estimated running time (1 input network against reference set of 108 basic networks )</th>
                                 </tr>
                               </thead>
                               <tbody>
                                  <tr>
                                     <td>10</td>
                                     <td>Fast</td>
                                     <td>&lt; 2 hours</td>
                                  </tr>
                                  <tr>
                                     <td>100</td>
                                     <td>Normal</td>
                                     <td>12 ~ 16 hours</td>
                                  </tr>
                                  <tr>
                                     <td>1000</td>
                                     <td>Slow</td>
                                     <td>Several days</td>
                                  </tr>
                               </tbody>
                            </table>

                        </div>


                        <div class='titleIndex h2'>
3） Alignment algorithm
                         </div>
                         <div class="contentIndex">
The four alignment algorithms are implemented on NFS. These algorithms have similar functions and any of them can work as NFS core alignment algorithm. Users can choose one from the list, and the default setting is “APCLUSTER”. To learn more about each algorithms, please refer to the original publications of algorithms at Citations(链接) section. 
                        </div>

                        <div class='titleIndex h2'>
4) Advanced parameters (Optional)
                         </div>
                         <div class="contentIndex">
NFS allow users to fine tune alignment algorithms through “Advanced parameters” panel. Theoretically, optimization of alignment algorithm performance is possible by adjusting advanced parameters for each algorithm. However, we recommended most users to keep the advanced parameters default. <br>
To set advanced parameters, click on the “Show Advanced Parameters” button, and open the “advanced parameters” panel. Depending on the selected alignment algorithm in “General parameters” panel, the corresponding advanced parameters are shown in the new “Advanced parameters” panel. <br>
                            <center><img src="static/image/help22.png"/></center>
We list the short explanations for all provided parameters for users’ quick referenece. These information is based on adapted and modified from original program README files.
                        </div>

                        <div class='titleIndex h3'>
Advanced parameters for “APCLUSTER”
                         </div>
                         <div class="contentIndex">
APCLUSTER of NFS relies on R package “apcluster”, which is an R implementation of Affinity Propagation clustering algorithm. It clusters data using a set of real-valued pairwise data point similarities as input. Each cluster is represented by a cluster center data point (the so-called exemplar). The method is iterative and searches for clusters maximizing an objective function called net similarity. Refer to XXXX文for more details. 
                            <table class="table">
                               <tbody>
                                  <tr>
                                     <td>
q
                                    </td>
                                     <td>
If q=NA, exemplar preferences are set to the median of non-Inf values in s. If q is a value between 0 and 1, the sample quantile with threshold q is used, whereas q=0.5 again results in the median as q= NA.
                                    </td>
                                  </tr>
                                  <tr>
                                     <td>
maxits
                                    </td>
                                     <td>
maximal number of iterations that should be executed.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
convits
                                    </td>
                                     <td>
the algorithm terminates if the examplars have not changed for convits iterations.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
lam
                                    </td>
                                     <td>
damping factor; should be a value in the range [0.5, 1); higher values correspond to heavy damping which may be needed if oscillations occur.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
nonoise
                                    </td>
                                     <td>
If FALSE, adds a small amount of noise to prevent degenerative cases; if TRUE, this is disabled.
                                     </td>
                                  </tr>

                               </tbody>
                            </table>
                        </div>

                       <div class='titleIndex h3'>
Advanced parameters for “ISORANK”
                         </div>
                         <div class="contentIndex">
ISORANK of NFS relies on an Linux Executable of isorank-N program. The program isorank-n (based on based on isorank and multiway_kpartite) can find a global alignment of input networks. Given two networks with N1, N2 nodes each, it returns min (N1,N2) matches, each match corresponding to best-matching nodes from the two networks. Refer to 文献“IsoRankN: Spectral methods for global alignment of multiple protein networks” for more details. 
                            <table class="table">
                               <tbody>
                                  <tr>
                                     <td>
K
                                    </td>
                                     <td>
max number of iterations.
                                    </td>
                                  </tr>
                                  <tr>
                                     <td>
thresh
                                    </td>
                                     <td>
the threshold for L1 norm of the change in the principal eigenvector between iterations.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
alpha
                                    </td>
                                     <td>
the parameter that controls the relative weight of network and sequence data. 0 means only sequence data, 1 means only network data. The sweet-spot's usually around 0.6-0.8.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
beta
                                    </td>
                                     <td>
the parameter that controls the relative weight of the first network to the second network. A beta of 0.5 weights both sets of networks equally and a beta of 0.75 weights the first network 3 times more than the second network.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
maxveclen
                                    </td>
                                     <td>
since the eigenvalue computation is being performed on a sparse matrix and the eigenvector is also sparse, you can choose how many non-zero entries you want. In each iteration, the algo will keep only <maxveclen> of the largest values.
                                     </td>
                                  </tr>

                               </tbody>
                            </table>

                        </div>


                      <div class='titleIndex h3'>
Advanced parameters for “SPINAL”
                         </div>
                         <div class="contentIndex">
SPINAL of NFS relies on Linux Executable SPINAL program. Given two intereaction networks, the global network alignment algorithm “SPINAL” returns a one-to-one global mapping between their nodes. Refer to (TODO) XXX for more details about SPINAL. 
                            <table class="table">
                               <tbody>
                                  <tr>
                                     <td>
alpha
                                    </td>
                                     <td>
the parameter that controls the relative weight of network topology and sequence. 0 means only sequence data, 1 means only network data.
                                    </td>
                                  </tr>
                               </tbody>
                            </table>
                        </div>


                       <div class='titleIndex h3'>
Advanced parameters for “GHOST”
                         </div>
                         <div class="contentIndex">
ISORANK of NFS relies on an Linux Executable of isorank-N program. The program isorank-n (based on based on isorank and multiway_kpartite) can find a global alignment of input networks. Given two networks with N1, N2 nodes each, it returns min (N1,N2) matches, each match corresponding to best-matching nodes from the two networks. Refer to 文献“IsoRankN: Spectral methods for global alignment of multiple protein networks” for more details. 
                            <table class="table">
                               <tbody>
                                  <tr>
                                     <td>
hops
                                    </td>
                                     <td>
The positive integer value for the radius of the subgraphs. The default value is 4.
                                    </td>
                                  </tr>
                                  <tr>
                                     <td>
nneighbors
                                    </td>
                                     <td>
The positive integer value for the number of nearest neighbors in H that each node in G will have a distance computed to. The default value is "all" which is coded as -1. 
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
searchiter
                                    </td>
                                     <td>
The positive integer value for the number of local search iterations that should be performed after the initial alignment is complete. The process will terminate early if the last loop yielded no changes. The default value is 10.
                                     </td>
                                  </tr>
                                  <tr>
                                     <td>
ratio
                                    </td>
                                     <td>
The positive decimal value for the ratio of "bad-moves" allowed during the local-searh phase of the alignment algorithm. The default value is 8.0.
                                     </td>
                                  </tr>
                               </tbody>
                            </table>

                        </div>

                        <div class='titleIndex h2'>
5) Choose a reference set of basic networks
                         </div>
                         <div class="contentIndex">
Retrieved from six pathway databases (KEGG, Reactome, NCI, PANTHER, Biocarta, HumanCyc), NFS contains a total of XXXX basic networks which are manually curated and revised by domain experts (arbitrarily, raw networks with less than 10 edges are excluded), and 49 biomedical relevant categories of reference sets extracted from these basic networks. The categories help users do network analysis with special research interest, such as regulatory circuits, signaling pathways, hormone regulation, disease or development, etc. On the NFS analysis page, mouse click to select one reference set from library. Otherwise click on learn more to explore the library of reference sets on the resource page. 
                            <center><img src="#"/>TODO[插入截屏]</center>
                        </div>

                        <div class='titleIndex h2'>
6) Submit a job to NFS server
                         </div>
                         <div class="contentIndex">
The last step is submitting the job to NFS server. Click “RUN Network Fingerprint Scan” button to submit. Optionally, user can enter an email address before submitting the job, notification emails with a web link to NFS result will be sent from NFS server to users’ email. The analysis results will be saved on NFS server for two weeks. 
                            <center><img src="#"/>TODO[插入截屏]</center>
                        </div>

                       <div class='titleIndex h2'>
7) Bookmark result page and retrieve later
                         </div>
                         <div class="contentIndex">
After submission is complete, you are redirected to the result page of NFS. The page shows a summary of this NFS program. Because a job can last hours or even days, NFS summary includes a web link to the result page. You can bookmark the web page in browser. You can open the result page through the link to monitor the job status (submitted, queued, running, or done)？？. The results page will be expired two weeks after the job submission time. Expired results will be deleted by NFS thereafter. 
                            <center><img src="#"/>TODO[插入截屏]</center>
                        </div>


                       <div class='titleIndex h1'>
Understand the Network Fingerprint result
                         </div>
                         <div class="contentIndex">
After the network fingerprint computation is done, <br>
1)  If users provide their email when submitting the job, NFS will send a notification email saying that the computation is completed. Click the web link in notification email to open result page.<br>
2)  If users haven’t close the webpage, network fingerprint result should appears automatically below the summary section. If the result page doesn’t refresh automatically, please refresh web page manually. <br>
3)  If users already closed the webpage and bookmarked result page, click this bookmark to open result page again. <br>
                            <center><img src="#"/>TODO[插入截屏]</center>
The NFS visualizes network fingerprints on result page. This network fingerprint is made up of two parts: <br>
The left part of result is “Fingerprint graph” of the network fingerprints. The fingerprints of multiple input network are visualized in different colors. Vertical axis indicates the similarity score between input networks and basic networks. Horizontal axis indicates the basic networks in order of categories. If you are scanning fingerprints for multiple input networks, the curves many overlap in certain region of fingerprint plot. To see one of several fingerprint more clearly, use curve legend above fingerprint curves to turn off other curves and turn on the one curve. In this way, users can examine network fingerprints one by one. Mouse-over the curves to see the corresponding similarity scores between one input network and one basic network. Mouse-click on the curves will expand a pairwise alignment details right below the fingerprint graph on the same page. <br>
                            <center><img src="#"/>TODO[插入截屏]</center>
The right part of result is “Fingerprint data” table about these network fingerprints. The fingerprints in “Fingerprint graph” are linked with items in “Fingerprint data”. When user mouse-over the fingerprint curves, the corresponding rows in “Fingerprint data” table are highlighted. The result table can be sort by basic network names and scores. You can also search a basic network name/keyword to find the scores of any specific network pairs. with re-organized as multiple data tabs, each of which lists the similarity scores between one input network and the basic networks (in another words, each tab in table view contain the same information of one curve in the “Fingerprint graph”).
                            <center><img src="#"/>TODO[插入截屏]</center>
                        </div>


                       <div class='titleIndex h1'>
Explore pairwise alignment details of Network Fingerprint
                         </div>
                         <div class="contentIndex">
From the network fingerprint results, you can identify fingerprint level differences of input networks and their functional associations with specific biomedical processes (events). Furthermore, the fingerprint graph also serves as entrance for a closer investigation at network alignment level. As we briefly mentioned in the previous section, each dot on fingerprint curves represents a pairwise similarity score between one input network and one basic network. In fact, when several fingerprint curves differ in the regions of certain basic networks/categories, it suggests that input networks have different similarities (associations) with those basic networks. If some novel associations seem informative, users can open the network comparison details of certain fingerprint dots. Conveniently, NFS are able to expand fingerprint dots into pairwise alignment details upon users’ mouse-click. 
After you click one fingerprint dot, “graphic view” and “Pairwise Alignment Data” of two network alignment show up below the original overview result. <br>
In the “graphic view”, left side is the input network and right side is the basic network. Mouse over network nodes to get information about the gene, which are hyperlinked to external databases, including ncbi gene, genecards.org, uniprot.org, genenames.org, ensemble, refseq_protein, and refseq_RNA. <br>
In the “Pairwise Alignment Data”, there are three tabs: 1) clusters, which consist of scores of gene clusters outputed by NFS program; 2) pathways, which are the enriched KEGG pathways in all nodes of this input and basic network; 3) functions, which is the enriched GeneOntology terms in all nodes of two networks. The tabs can be sorted respectively to find desired clusters, pathways and GO terms. You can also search a keyword (pathway name, GO term) in the “Pairwise Alignment Data”. Click on Data rows and the corresponding nodes are highlighted in the “graphic view”. <br>
If users want to see other pairwise network alignments, click on another fingerprint dot. The “graphic view” and “Pairwise Alignment Data” are updated. Each time only one pairwise alignment can be explored on result page.<br>
                        </div>

                      <div class='titleIndex h1'>
Download graphs, tables and PDF report
                         </div>
                     <div class="contentIndex">
The graphic results, data tables and PDF report can be exported to your local disk. Go to the top of whole NFS result page, click on “Download PDF Report” button to export a complete PDF report of job information, program settings, graphs and data table. An example PDF report can be downloaded from here (TODO 加上链接，例子报告导出).
In addition, there is a download button on upper-right corner in every section of the result page.
                            <center><img src="#"/>TODO[插入图片1，告诉用户如何导出数据和图片]</center>
                            <center><img src="#"/>TODO[图片2]</center>
                            <center><img src="#"/>TODO[图片3]</center>

                     </div>

                      <div class='titleIndex h1'>
Expiration time of result page
                         </div>
                     <div class="contentIndex">
NFS result are not stored permanently on NFS server. All results will be deleted after two weeks since the job is submitted to NFS server. For example, the web link to the result page expires at the same time. It is highly recommended to download your results as soon as possible.
                     </div>


                      <div class='titleIndex h1'>
Disclaimer
                         </div>
                     <div class="contentIndex">
NFS is provided as a free public resource. We strive to reach a high level of quality, but can’t legally guarantee correctness, because all data is based on other public resources. The providers of this service do not guarantee the accuracy of any data networks or the original data on which that they are based. The providers of this service do not guarantee the suitability of databases or the services for any purpose. <br>
Some of the original data used by the service may be subject to patent, copyright or other intellectual property rights that place restrictions on the use or redistribution of these data. It is the responsibility of the users of this service to ensure that their use of the service does not infringe on such rights and restrictions.<br>
The providers of this service will attempt to maintain continuity of services and provide sufficient warning for changes or cancellations of services. However, the providers of this service do not accept responsibility for temporary or permanent unavailability of services.<br>
                     </div>



                      <div class='titleIndex h1'>
Copyright 
                         </div>
                     <div class="contentIndex">
NFS is licensed under a Creative Commons Attribution 3.0 License (http://creativecommons.org/choose/ 看一下怎么选择，现在好像4.0版本了，http://graphml.graphdrawing.org/ ). This means that you are free to copy, distribute, display and make commercial use of all results aquired from the NFS webserver, provided that appropriate credit is given. NFS is intended to be a service to the community. It may be used free of charge in scientific and commercial software alike. 
                     </div>


                      <div class='titleIndex h1'>
Acknowledgement 
                         </div>
                     <div class="contentIndex">
The webserver acknowledges several open-source projects and codes:（苏明明发了一封邮件提供资料，需要选一下那些是相关的）
R
R
Rstudio
igraph
ggplot
clusterProfiler
Django
Bootstrap
jsTree
d3.js
JavaScript InfoVis Toolkit
typeahead.js
IsoRank-N2
SPINAL
GHOST
Apcluster
java
spring 4.0   
mybatis    
jquery
e-charts   
cytoscape web
jsPDF


Data are curated by Wenjian Xu and Li Fei
Webserver designed by Li Fei
                     </div>


                      <div class='titleIndex h1'>
Citation 
                         </div>
                     <div class="contentIndex">
If you will find the results produced by NFS useful, please cite:

Cui X, He H, He F, Wang S, Li F, Bo X. Network fingerprint: a knowledge-based characterization of biomedical networks. Scientific Reports. 2015 Aug 26;5:13286. doi: 10.1038/srep13286. PubMed PMID: 26307246; PubMed Central PMCID: PMC4549786

统一加链接(http://www.ncbi.nlm.nih.gov/pubmed/23047556)

If you are interested in alignment algorithms used by NFS, please refer to:
Liao CS, Lu K, Baym M, Singh R, Berger B. IsoRankN: spectral methods for global alignment of multiple protein networks. Bioinformatics. 2009 Jun 15;25(12):i253-8. doi: 10.1093/bioinformatics/btp203. PubMed PMID: 19477996; PubMed Central PMCID: PMC2687957.
Patro R, Kingsford C. Global network alignment using multiscale spectral signatures. Bioinformatics. 2012 Dec 1;28(23):3105-14. doi:10.1093/bioinformatics/bts592. Epub 2012 Oct 9. PubMed PMID: 23047556; PubMed Central PMCID: PMC3509496. 
Aladag AE, Erten C. SPINAL: scalable protein interaction network alignment. Bioinformatics. 2013 Apr 1;29(7):917-24. doi: 10.1093/bioinformatics/btt071. Epub 2013 Feb 14. PubMed PMID: 23413436.
Bodenhofer U, Kothmeier A, Hochreiter S. APCluster: an R package for affinity propagation clustering. Bioinformatics. 2011 Sep 1;27(17):2463-4. doi:10.1093/bioinformatics/btr406. Epub 2011 Jul 6. PubMed PMID: 21737437.
                     </div>


                     <div class='titleIndex h1'>
FAQ 
                     </div>
                     <div class='titleIndex h2'>
What is edge list format? 
                     </div>
                     <div class="contentIndex">
The edgelist format is a simple text file, with one edge in a line, the two vertex ids separated by a space character.
                            <center><img style="width:20%" src="static/image/help25.png"/></center>
                     </div>

                     <div class='titleIndex h2'>
What is igraph?
                     </div>
                     <div class="contentIndex">
The igraph is a collection of network analysis tools. It can also import and export many network formats. In the help section <a href="">Make an input network from other formats”</a>, we describes how to export edgelist and graphml from R. Visit http://igraph.org/ for more about igraph. 
                     </div>


                     <div class='titleIndex h2'>
What is network fingerprint?
                     </div>
                     <div class="contentIndex">
In the Cui et.al 2015, a biomedical network is characterized as a spectrum-like vector called “network fingerprint”, which contains similarities to basic networks. This knowledge-based multidimensional characterization provides a more intuitive way to decipher molecular networks, especially for large-scale network comparisons and clustering analyses. 
                     </div>


                     <div class='titleIndex h2'>
Which alignment algorithms should I use in NFS analysis?
                     </div>
                     <div class="contentIndex">
NFS current implemented four alignment algorithms. We have no discrimination on the performance of these algorithms in terms network fingerprint analysis and network alignment. Among them, “apcluster” is used in original publication of network fingerprint (Cui et al. 2015). Refer to Citation for more information about alignment algorithms.
                     </div>


                     <div class='titleIndex h2'>
What basic networks should I select from library in NFS analysis?
                     </div>
                     <div class="contentIndex">
NFS is knowledge-based computational framework to decipher biomedical networks by making systematic comparisons to reference sets of well-studied “basic networks”. The fingerprints of biomedical networks is associated with users’ choice of reference sets. We recommend users to browse “Resource” page and find the most appropriate reference set relating to their research topics.
                     </div>
                     



    <div class="gotop" style="right: 9px;">
		<a href="#overviewbodyA"
			title="Back to the top of the page"><span
			class="glyphicon glyphicon-circle-arrow-up"></span> Top</a>
	</div>
    			<!-- Footer -->
	<footer id="footer1" style="margin-bottom: -35px;"  >	
				<!-- Lower Footer -->
				<div id="lower-footer" >
				<div style="margin-left: 98%">
						<script type="text/javascript" src="//ra.revolvermaps.com/0/0/3.js?i=0eu6839u0la&amp;b=0&amp;s=26&amp;m=2&amp;cl=ffffff&amp;co=010020&amp;cd=aa0000&amp;v0=60&amp;v1=60&amp;r=1" async="async"></script>
				</div>
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;width: 100%;">
						<div align="center">
 								 <p class="copyright">NFP is supported by a grant from National Nature Science Foundation of China.
								 </p>
								 <p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2015-2016 Beijing Institute of Radiation Medicine</p>
 								</div>

						</div>
						
						
					</div>
					
				</div>
				<!-- /Lower Footer -->
				
			
			</footer>
			</div>
			<!-- /Footer -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="http://v3.bootcss.com/assets/js/docs.min.js"></script>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#navbar-example li").bind("click",function(){
			liClickEvent(this);
		});
		linkSelect();
	     $("section").scroll(function(event){
			console.log(event);
			//console.log($(window));
	     });
	});
	function playtour(type){
		setCookie("play",type);
		window.location.href = "networksimilarityAnalysis?type=" + type + "&play=" + type;
	}
	function setCookie(name,value) 
	{ 
		var Days = 30; 
		var exp = new Date(); 
		exp.setTime(exp.getTime() + Days*24*60*60*1000); 
		document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
	} 
	function linkSelect(){
		var url= window.location.href;
		var index = url.substring(url.lastIndexOf('nfs/') + 4);
		if(index.indexOf('#')!=-1){
			$("#navbar-example li").removeClass("active");
			
			$("#navbar-example a[href='"+index+"']").parent().addClass("active");
		}

	}
	function liClickEvent(obj){
		$("#navbar-example li").removeClass("active");
		
		$(obj).addClass("active");
	}
	function showTip(){
		$("#tipInfo").html("System is under construction!");
		$("#tipModal").modal('show');
	}
	function showTip1(){
		var username = '<%=session.getAttribute("username") %>';
		if(username!=undefined&&username!=""){
			window.location.href
		}else{
			$("#tipInfo").html("Please log in or Analysis!");
			$("#tipModal").modal('show');
		}
	
	}
	function changetab(div){
		$(".avtivebody").hide();
		$(".avtivebody").removeClass("avtivebody");
		$("#" + div).addClass("avtivebody");
		$("#" + div).show();
	}
	
	</script>
</body>
</html>