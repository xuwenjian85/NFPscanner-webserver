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
        .titleIndex{
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<body style="font-size:medium; line-height: 1.5em" >
					<div class="container">
			<!-- Header -->
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">
				
				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							<img src="static/image/b2.png" style="width: 110px;margin-top: -20px;margin-right: -20px;"/>
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
            <div class="col-md-9" role="main">
                <div class="bs-docs-section">


                    <div id="overviewbodyA" class="avtivebody">
                        <div class="titleIndex">Overview</div>
                        <div class="contentIndex">
                            <p>
                                There are two services provide by NFS webserver. In NFS analysis, users upload input networks, selected one basic network set
                                from resource library, and run this analysis to extract fingerprints of input networks. In pairwise alignment, users upload two input networks and find their alignments relations.
                                If you have gene lists rather than gene network, you can make input networks from gene lists. Please refer to Make a input network from a gene list for more details.
                                More background knowledge about network fingerprint framework and related network alignment algorithms, please refer to citation.
                            </p>
                        </div>
                    </div>
                    <div id="quickStartbodyA" class='hidebody'>
                        <div class="titleIndex">Quick Start</div>
                        <div class="contentIndex">
                            <p>New to NFS? Try the tutorials now.<br>
                                Fingerprint Scanning <a onclick="playtour(1)"><span style="padding:0 10px;" class="btn btn-default" >Tutorials</span></a><br>
                                Pairwise alignment <a onclick="playtour(2)"><span style="margin-top:5px;padding:0 10px;" class="btn btn-default" >Tutorials</span></a>
                            </p>
                        </div>
                    </div>
                    <div id="genelistbodyA"class='hidebody'>
                        <div class="titleIndex">Make a input network from a gene list</div>
                        <div class="contentIndex">
                            <p>In case you only have a list of genes rather than a network, please try one of following tools to make a network from gene list.</p><br>
                            <p><span class='titleIndex'>Tool #1:</span> <br>
                                GeneMANIA is a user-friendly interface for generating functional networks. It only take a few steps to convert your list of genes into a network file.
                                Suppose the list is gene symbols. Open the GeneMANIA page (<a href="http://www.genemania.org" target="_blank">http://www.genemania.org</a>),
                                select species name “H. sapiens(human)”, enter input by typing a list of gene symbols (e.g. MSH2), then click “GO”.
                            </p><br>
                            <img src="static/image/help1.png"/>
                            <p><br>
                                A few seconds later, you are redirected to the result page, which have visualized functional network. Click on File -> Save network as text to download the network text file.
                            </p><br>
                            <img src="static/image/help2.png"/>
                            <p><br>
                                Open the text file, and find the first two columns (under the title “Entity 1” and “Entity 2”). Copy them and save it in a new text file.
                                This file is in “edgelist” format and an acceptable input on our NFS webserver.
                            </p>
                            <img src="static/image/help3.png"/>
                            <p><br><span class='titleIndex'>Tool #2:</span> <br>
                                BioProfiling.de is a comprehensive analytical toolkit for interpretation of a gene list. It only take a few steps to convert your list of genes into a network file.
                                Open the BioProfiling.de “submit a gene list” page at <a href="http://www.bioprofiling.de/gene_list.html" target="_blank">http://www.bioprofiling.de/gene_list.html</a>.
                                Upload an input text file with one gene ID (Entrez Gene, UniProt/Swiss-Prot, HUGO Gene Symbol, etc.) per line, select organism “Homo sapiens”, then click “Submit” button.
                            </p><br>
                            <img src="static/image/help4.png"/>
                            <p><br>
                                Refresh the main result page after 5 minutes, find the PPI_spider Tool in the table. Click “Link to results” of the PPI_spider row.
                            </p><br>
                            <img src="static/image/help5.png"/>
                            <p><br>
                                In the next “Result:PPI_spider” page, click the Model_D3.txt to download the network file
                            </p><br>
                            <img src="static/image/help6.png"/>
                            <p><br>
                                Open the text file, and the top section is “*edges” information. Copy the first two columns and save it in a new text file.
                                This file is in “edgelist” format and an acceptable input on our NFS webserver.
                            </p><br>
                            <img src="static/image/help7.png"/>
                            <p><br><span class='titleIndex'>Tool #3: </span><br>
                                “STRING is a database of known and predicted protein interactions. The interactions include direct (physical) and indirect (functional) associations.
                                ”(From String homepage). String database can convert your list of genes into a network file.<br>
                                Open the String database page at <a href="http://string-db.org" target="_blank">http://string-db.org/,</a> switch to “multiple names” tab.
                                Make sure the interactors wanted is “proteins”. Enter one list of gene symbol per line by uploading a text file or pasting text, select organism “Homo sapiens”, then click “GO!” button.
                            </p><br>
                            <img src="static/image/help8.png"/>
                            <p><br>
                                Next page will display the matched proteins by String database. Click “Continue” button.
                            </p><br>
                            <img src="static/image/help9.png"/>
                            <p><br>
                                The result is network generated from the gene list. Click “Save” – “other formats” to open the download page.
                            </p><br>
                            <img src="static/image/help10.png"/>
                            <p><br>
                                From a long list of network format, find (TXT –simple tab delimited flatfile). Open the tabdelimited.**.txt.
                            </p><br>
                            <img src="static/image/help11.png"/>
                            <p><br>
                                In the txt file looks like the following table, copy and paste the first two columns into a new txt file.
                                This new file is in “edgelist” format and an acceptable input on our NFS webserver.
                            </p><br>
                            <img src="static/image/help12.png"/>
                            <p><br><span class='titleIndex'>Tool #4: </span><br>
                                Cytoscape (<a href="http://www.cytoscape.org/" target="_blank">http://www.cytoscape.org/</a>) is another popular platform to visualize and integrate biological networks.
                                If you have a network in Cytoscape session and want to analyze your network with NFS, simply click “Export Table to File” button,
                            </p><br>
                            <img src="static/image/help13.png"/>
                            <p><br>
                                In the “Export Table” dialog, select option “Network default edge” and click “OK” button.
                            </p><br>
                            <img src="static/image/help14.png"/>
                            <p><br>
                                In the next dialog window, enter the csv file name and click “OK” button.
                            </p><br>
                            <img src="static/image/help15.png"/>
                            <p><br>
                                The second column of the csv file contain the edge information. With text editors, you can prepare a tab delaminated “edgelist” for NFS analysis.
                            </p><br>
                            <p><br><span class='titleIndex'>Tool #5: </span><br>
                                Need to write this paragraph.(<a href="http://apps.cytoscape.org/apps/jactivemodules#cy-app-releases-tab" target="_blank">http://apps.cytoscape.org/apps/jactivemodules#cy-app-releases-tab</a>)
                                to extract expression activated subnetworks from a molecular interaction network background by jActiveModules
                            </p><br>
                        </div>
                    </div>
                    <div id="igraphclassbodyA" class='hidebody'>
                        <div class="titleIndex">Make a input network from igraph class</div>
                        <div class="contentIndex">
                            <p>NOTE: this section is only for R users to convert igraph data into “edgelist” and “graphml”.
                                Use the following command to prepare your input network for NFS analysis.
                            </p><br>
                            <img src="static/image/help16.png"/>
                        </div>
                    </div>
                    <div id="UploadbodyA" class='hidebody'>
                        <div class="titleIndex">Upload the input network</div>
                        <div class="contentIndex">
                            <p>This section describes how to upload the input network(s) to NFS server. Open the NFS website, navigate to “Network Fingerprint Scan (NFS)” tab.
                                The NFS analysis can extract fingerprint from single or multiple input networks. The format of input networks can be either edge list or graphml format.
                                (Note: If you only have gene list rather ready-to-use networks, please read the previous two sections “Make an input network from a gene list” and “Make
                                a input network from igraph class” and prepare the network files accordingly.)
                                In the “Input Networks” section, input one network by entering text directly or uploading a network file, select the id type from dropdown list, then click “OK” button
                            </p>
                            <br>
                            <img src="static/image/help17.png"/>
                            <br>
                            <img src="static/image/help18.png"/>
                            <br><br>
                            <p>After the input network is uploaded and parsed, a network graph is previewed on the right side. Now you have successfully uploaded one input network to NFS. <br>
                                Optional: If you want to extract network fingerprint from multiple networks, just click the “add more networks” button to open an additional input section below.
                                The maximum number of input networks is five on current NFS webserver.
                            </p>
                        </div>
                    </div>
                    <div id="SetparametersbodyA"class='hidebody'>
                        <div class="titleIndex">Set parameters</div>
                        <div class="contentIndex">
                            <p>This section describes how to set parameters for NFS analysis. To compute the network fingerprint for input network(s), you need to set the following general parameters:<br>
                                <span class='titleIndex'>1. Similarity measures between network nodes:</span><br>
                                Default similarity setting is “Gene Ontology”, which is based on sematic similarity score of nodes’ GO terms.
                                Alternatively, you can also use sequence blast scores as similarity measure by choose “Sequence” similarity settings.<br>
                                <span class='titleIndex'>2. Permutation cycles:</span><br>
                                The permutation of basic networks is the necessary step to calculate standardized similarity scores, which is the basic element of network fingerprint.
                                For a basic network, a sample size of 100 randomized networks is recommended to estimate the distribution of similarity scores and standardize similarity scores.
                                The calculation time of 100 permutation cycles on one basic network takes ten minutes on NFS webserver.
                                It is equivalent to say that NFS may run 12 hours to return one network fingerprint if KEGG signaling pathways (contain 108 basic networks). However,
                                10 permutation cycles can shorten the time cost of fingerprint extraction to a couple of hours. Therefore we encourage for all users to run initial run with the default setting “10”.
                                After you evaluate the initial result, decide whether to run 100 or 1000 permutation cycles.<br>
                                <span class='titleIndex'>3. Alignment algorithm:</span><br>
                                The four algorithms are supported by NFS. These algorithm are similar in function but designed with a different emphasis. Choose one from the list,
                                and the default setting is “APcluster”. To learn more about each algorithms, please refer to what is the difference between the algorithms?<br>
                                In order to optimize output quality or gain more control of NFS program, advanced users are able to adjust advanced parameters for selected alignment algorithm. <br>
                                <span class='titleIndex'>4. Advanced parameters:</span><br>
                                Click on the “Show Advanced Parameters” button, open the “advanced parameters” panel. Depending on the selected alignment algorithm in “General parameters” panel,
                                the corresponding advanced parameters are shown in the new “Advanced parameters” panel:<br><br>
                                <img src="static/image/help19.png"/>
                                <br><br>
                                Here we list the short explanations for all provided parameters in this panel.<br>
                                <span class='titleIndex'>&emsp;For “APclusters”: </span><br>
                                Affinity Propagation clusters data using a set of real-valued pairwise data point similarities as input.
                                Each cluster is represented by a cluster center data point (the so-called exemplar). The method is iterative and searches for clusters maximizing an
                                objective function called net similarity. Refer to XXXX文献 for more details. <br>
                                <span class='titleIndex'>q:</span>&emsp;If q=NA, exemplar preferences are set to the median of non-Inf values in s. Ifq is a value between 0 and 1,<br>
                                the sample quantile with threshold q is used, whereas q=0.5 again results in the median.<br>
                                <span class='titleIndex'>maxits:</span>&emsp;maximal number of iterations that should be executed<br>
                                <span class='titleIndex'>convits:</span>&emsp;the algorithm terminates if the examplars have not changed for convits iterations<br>
                                <span class='titleIndex'>lam:</span>&emsp;damping factor; should be a value in the range [0.5, 1); higher values correspond to heavy damping which may
                                be needed if oscillations occur<br>
                                <span class='titleIndex'>nonoise:</span>&emsp;adds a small amount of noise to s to prevent degenerate cases; if TRUE, this is disabled<br>
                                <span class='titleIndex'>&emsp;For “ISORANK”:</span><br>
                                The program isorank-n (based on based on isorank and multiway_kpartite) can find a global alignment of input networks.
                                Given two networks with N1, N2 nodes each, it returns min (N1,N2) matches, each match corresponding to best-matching nodes from the two networks.
                                Refer to 文献“IsoRankN: Spectral methods for global alignment of multiple protein networks” for more details. <br>
                                <span class='titleIndex'>K:</span>&emsp;max number of iterations you should run this for.<br>
                                <span class='titleIndex'>thresh:</span>&emsp;	the threshold for L1 norm of the change in the principal eigenvector between iterations.<br>
                                <span class='titleIndex'>alpha:</span>&emsp;	the parameter that controls the relative weight of network and sequence data. 0 means only sequence data, 1 means
                                only network data. The sweet-spot's usually around 0.6-0.8.<br>
                                <span class='titleIndex'>beta:</span>&emsp;the parameter that controls the relative weight of the first network to the second network. A beta of 0.5 weights both
                                sets of networks equally and a beta of 0.75 weights the first network 3 times more than the second network.<br>
                                <span class='titleIndex'>maxveclen:</span> &emsp;since the eigenvalue computation is being performed on a sparse matrix and the eigenvector is also sparse,
                                you can choose how many non-zero entries you want. In each iteration, the algo will keep only <maxveclen> of the largest values.<br>
                                    <span class='titleIndex'>&emsp;For “SPINAL”:</span><br>
                                    Given two intereaction networks, the nework alignment algorithm “SPINAL” returns a one-to-one global mapping between their nodes. Refer to XXX for more details about SPINAL. <br>
                                    <span class='titleIndex'>alpha:</span>&emsp;the parameter that controls the relative weight of network topology and sequence. 0 means only sequence data, 1 means only network data. <br>
                                    <span class='titleIndex'>&emsp;For “GHOST”:</span><br>
                                    GHOST is a program that aligns two networks using an algorithm detailed in "Global Network Alignment Using Multiscale Spectral Signatures" by Rob Patro and Carl Kingsford.
                                    Similar to IsoRank, NFS adapts GHOST to combine topological distance and similarity distance. Refer to 文献“” for more details about GHOST. <br>
                                    <span class='titleIndex'>hops:</span>&emsp;The positive integer value for the radius of the subgraphs. The default value is 4.<br>
                                    <span class='titleIndex'>nneighbors:</span>&emsp;The positive integer value for the number of nearest neighbors in H that each node in G will have a distance computed to. The default value is "all" which is coded as -1. <br>
                                    <span class='titleIndex'>searchiter:</span>&emsp;The positive integer value for the number of local search iterations that should be performed after the initial
                                    alignment is complete.The process will terminate early if the last loop yielded no changes. The default value is 10.<br>
                                    <span class='titleIndex'>ratio:</span>&emsp;The positive decimal value for the ratio of "bad-moves" allowed during the local-searh phase of the alignment algorithm. The default value is 8.0.<br><br>
                                    <img src="static/image/help20.png"/>
                            </p>
                        </div>
                    </div>
                    <div id="librarybodyA"class='hidebody'>
                        <div class="titleIndex">Choose a set of basic networks from library</div>
                        <div class="contentIndex">
                            <p>The library of basic networks contains 49 sets of manually curated basic networks, which are originally retrieved from 6 network databases (KEGG, Reactome, NCI, SPIKE, HumanCyc, PANTHER).
                            </p>
                        </div>
                    </div>
                    <div id="serverbodyA"class='hidebody'>
                        <div class="titleIndex">Submit a job to NFS server</div>
                        <div class="contentIndex">
                            <p>
                                Now you can click on “RUN Network Fingerprint Scan” button to submit the job to NFS server. Optionally, enter an email address before submitting the job,
                                notification emails about the status of this job will be sent there. The analysis results will be saved on NFS server for two weeks temporarily.
                            </p>
                        </div>
                    </div>
                    <div id="BookmarkbodyA"class='hidebody'>
                        <div class="titleIndex">Bookmark result page and retrieve later</div>
                        <div class="contentIndex">
                            <p>
                                After submission is complete, you are redirected to the result page of NFS. The top and first section is a summary of this NFS program.
                                Because a NFS job can take hours and some may take days, NFS summary returns a web link to the result.
                                You can bookmark the web page in browser or save web link in other ways. You can open the web link later to see the job status (submitted, queued,
                                running, or Done) and the run time. The web links and results will be accessible within two weeks of its submission time. All expired results will be deleted thereafter.<br>
                                Job ID:&emsp;XXasdfasdfasdfCFSDFSDFSDFXFDSFSD<br>
                                Web link:&emsp;http://202.38.153.233:2217/NFS/id=ReporXFSDFSDFSDFSDFSDFGGEGE<br>
                                Start time:&emsp;2015.11.11xxxxxxx<br>
                                Run time:&emsp;00:00:26<br>
                                Input network:&emsp;AAAAAANet1, DDDDDDNet2<br>
                                Parameters:&emsp;Similarity - Gene Ontology, Permutation cycles - 10, Alignment algorithm - APcluster<br>
                                Basic networks:&emsp;NCI signaling networks (60 basick networks)<br>
                                Your email:&emsp;xxxx@mail.com<br>
                                <img src="static/image/help21.png"/>
                            </p>
                        </div>
                    </div>
                    <div id="UnderstandbodyA"class='hidebody'>
                        <div class="titleIndex">Understand the overview of NFS result</div>
                        <div class="contentIndex">
                            <p>
                                After the NFS computation is done, it should show NFS result details below the summary section. If the result page doesn’t refresh automatically,
                                please refresh manually. If you already closed the webpage and bookmarked result page, click this bookmark to open result page again.
                                Right below the summary section is the main body of NFS results.<br><br>
                                <img src="static/image/help24.png"/><br>
                                <img src="static/image/help23.png"/><br><br>
                                The NFS returns an overview of network fingerprints to result page by default. This overview has two parts: <br>
                                &emsp;The left part of result is “Fingerprint graph” of the network fingerprints. The fingerprints of multiple input network are visualized as colored curves.
                                Vertical axis indicates the similarity score of network pairs and horizontal axis indicates the different basic networks in order of network categories.
                                If you are doing fingerprints scanning for multiple input networks, the curves many overlap in certain region of fingerprint plot.
                                To see one of several fingerprint curves more clearly, choose the color in legend above fingerprint curves and left click on the legend item.
                                Now all other fingerprint curve will be hidden and only the one you choose is shown. You can also examine the fingerprints one by one. Mouse-over the dots on
                                curves and the corresponding similarity scores between one input network and one basic network. <br>
                                &emsp;The right part of result is “Fingerprint data” of network fingerprints. The fingerprints in “Fingerprint graph” are re-organized as multiple data tabs,
                                each of which lists the similarity scores between one input network and the basic networks (in another words, each tab in table view contain the same information of one
                                curve in the “Fingerprint graph”). The result table can be sort by categories, basic network names and scores. You can also search a basic network name/keyword to
                                find the scores of any specific network pairs. <br>
                            </p>
                        </div>
                    </div>
                    <div id="ExplorebodyA"class='hidebody'>
                        <div class="titleIndex">Explore pairwise alignment details of NFS result</div>
                        <div class="contentIndex">
                            <p>
                                &emsp;From the overview result, you can identify functional differences of input networks and their associations with various biomedical processes (events).
                                Furthermore, the overview section also serves as entrance for a deeper investigation of network fingerprints. As we discussed in the previous section,
                                each dot on fingerprint curves represents a pairwise similarity score between one input network and one basic network. In fact,
                                several fingerprint curves differ in the regions above certain basic networks/categories, which suggest input networks have different association strength with these networks.
                                If some associations are unknown and potentially informative, researchers would be interested to see the network comparison details of certain fingerprint dots.
                                &emsp;Conveniently, NFS are able to expand fingerprint dots into pairwise alignment details upon users’ mouse click action. <br>
                                &emsp;After you choose and expand one fingerprint dot, “graphic view” and “table view” of two network alignment show up below the original overview result. <br>
                                In the “graphic view”, left side is the input network and right side is the basic network. Network nodes are hyperlinked to external databases,
                                including ncbi gene, genecards.org, uniprot.org, genenames.org, ensemble, refseq_protein, and refseq_RNA. <br>
                                &emsp;In the “table view”, there are three tabs: 1) clusters, which consist of scores of gene clusters grouped by current NFS program setting; 2) pathways,
                                which is the enriched KEGG pathways in all nodes of this input and basic network pair; 3) functions, which is the enriched GeneOntology terms in all nodes of that.
                                (XXX需要修改). The tabs can be sorted respectively to find most “biologically important” clusters, pathways and GO terms. You can also search a keyword (pathway name, GO term)
                                to query the tabs. Click on any “table view” items and the corresponding nodes are highlighted in the “graphic view”. <br>
                                &emsp;If you are finishing viewing the current pairwise alignment and want to see other pairwise network alignments, click on another fingerprint dot.
                                The “graphic view” and “table view” are updated. Each time only one pairwise alignment can be explored.<br>
                            </p>
                        </div>
                    </div>
                    <div id="DownloadbodyA"class='hidebody'>
                        <div class="titleIndex">Download graphs, tables and PDF report</div>
                        <div class="contentIndex">
                            <p>
                                &emsp;The graphic results, data tables and PDF report of NFS can be exported to your local disk. Go to the top (or bottom) of whole NFS result page,
                                click on “Download PDF Report” button to export a complete PDF report of analysis date, program settings, graphs and data table.
                                An example PDF report can be downloaded from here(加上链接，例子报告导出).<br>
                                &emsp;In addition, there is a download button on upper-right corner in every section of the result page. You can freely download certain part of result rather than the whole report. <br>
                                [插入图片1，告诉用户如何导出数据和图片]<br>
                                [图片2]<br>
                                [图片3]<br>
                            </p>
                        </div>
                    </div>
                    <div id="APIbodyA" class='hidebody'>
                        <div class="titleIndex">Use NFS with RESTful API</div>
                        <div class="contentIndex">
                            <p>
                                You can use NFS server through RESTful API service. Here is an example:<br>
                                &emsp;RESTful API interface of NFS is fully documented for both accessing NFS framework from any software applications and batch-downloading reference network databases and NFS analysis results.
                            </p>
                        </div>
                    </div>
                    <div id="ExpirationbodyA" class='hidebody'>
                        <div class="titleIndex">Expiration time of result page</div>
                        <div class="contentIndex">
                            <p>
                                &emsp;NFS result are not stored permanently on NFS server. All results will be deleted after two weeks since the job is submitted to NFS server.
                                For example, the web link to the result page will expired at the same time. It is highly recommended to download your results as soon as possible.<br>
                            </p>
                        </div>
                    </div>
                    <div id="PairwisebodyA" class='hidebody'>
                        <div class="titleIndex">Pairwise alignment analysis</div>
                        <div class="contentIndex">
                            <p>
                                Besides the NFS analysis, pairwise alignment analysis of two input networks is available as well.
                                Since the NFS computation is technically a summarization of many pairwise alignments, the work flow of pairwise alignment analysis is similar to that of NFS.
                                Here is a brief description of pairwise alignment (and its differences from NFS):<br>
                                &emsp;1. Upload input networks: similar to NFS, except two input networks are required. <br>
                                &emsp;2. Set parameters: similar to NFS, except permutation cycles are excluded. <br>
                                &emsp;3. Submit a job to NFS server: similar to NFS.<br>
                                &emsp;4. Bookmark result page and retrieve later: similar to NFS. However, the pairwise alignment are usually completed within a couple of minutes. No need to “retrieve later”. <br>
                                &emsp;5. Explore pairwise alignment result: similar to the section “Explore pairwise alignment details of NFS result” of NFS. <br>
                                &emsp;6. Download graphs, tables and PDF report: similar to NFS.<br>
                                &emsp;7. Expiration time of result page: the same policy as NFS.<br>
                            </p>
                        </div>
                    </div>
                    <div id="DisclaimerbodyA" class='hidebody'>
                        <div class="titleIndex">Disclaimer</div>
                        <div class="contentIndex">
                            <p>
                                &emsp;NFS is provided as a free public resource. We strive to reach a high level of quality, but can’t legally guarantee correctness,
                                because all data is based on other public resources. The providers of this service do not guarantee the accuracy of any data networks or the original
                                data on which that they are based. The providers of this service do not guarantee the suitability of databases or the services for any purpose. <br>
                                &emsp;Some of the original data used by the service may be subject to patent, copyright or other intellectual property rights that place restrictions on
                                the use or redistribution of these data. It is the responsibility of the users of this service to ensure that their use of the service does not infringe on such rights and restrictions.<br>
                                &emsp;The providers of this service will attempt to maintain continuity of services and provide sufficient warning for changes or
                                cancellations of services. However, the providers of this service do not accept responsibility for temporary or permanent unavailability of services.<br>
                            </p>
                        </div>
                    </div>
                    <div id="CopyrightbodyA" class='hidebody'>
                        <div class="titleIndex">Copyright</div>
                        <div class="contentIndex">
                            <p>
                                &emsp;NFS is licensed under a Creative Commons Attribution 3.0 Unported License. This means that you are free to copy, distribute,
                                display and make commercial use of all results aquired from the NFS webserver, provided that appropriate credit is given.
                            </p>
                        </div>
                    </div>
                    <div id="AcknowledgementbodyA" class='hidebody'>
                        <div class="titleIndex">Acknowledgement</div>
                        <div class="contentIndex">
                            <p>
                                The webserver acknowledges several open-source projects and codes:<br>
                                &emsp;Django<br>
                                &emsp;Bootstrap<br>
                                &emsp;jsTree<br>
                                &emsp;d3.js<br>
                                &emsp;JavaScript InfoVis Toolkit<br>
                                &emsp;typeahead.js<br>
                                &emsp;IsoRank-N2<br>
                                &emsp;SPINAL<br>
                                &emsp;GHOST<br>
                                &emsp;Apcluster<br>
                                &emsp;R<br>
                                &emsp;Rstudio<br>
                                Server Data are curated by Li Fei and Li Fei.<br>
                                Website design by Li Fei and Wenjian Xu.
                                <br>
                            </p>
                        </div>
                    </div>
                    <div id="faqbodyA" class='hidebody'>
                        <div class="titleIndex">FAQ:</div>
                        <div class="contentIndex">
                            <p>
                                What is edge list format?<br>
                                &emsp;The edgelist format is a simple text file, with one edge in a line, the two vertex ids separated by a space character.<br>
                                <img src="static/image/help22.png"/><br><br>
                                <span class='titleIndex'>What is igraph?</span><br>
                                &emsp;The igraph is a collection of network analysis tools. It can handle and export many formats of network files. In the help section
                                “Make an input network from igraph class”, we describes how to export edgelist and graphml from R. Visit <a href="http://igraph.org/" target="_blank">http://igraph.org/ </a>
                                to learn more about igraph. <br>
                                <span class='titleIndex'>What is network fingerprint?</span><br>
                                &emsp;In the Cui et.al, a biomedical network is characterized as a spectrum-like vector called “network fingerprint”, which contains similarities
                                to basic networks. This knowledge-based multidimensional characterization provides a more intuitive way to decipher molecular networks,
                                especially for large-scale network comparisons and clustering analyses. <br>
                                <span class='titleIndex'>Which alignment algorithms should I use in NFS analysis?</span><br>
                                &emsp;NFS current implemented four alignment algorithms. We have no discrimination on the pros and cons of these algorithm in terms network
                                fingerprint extraction. Among them, “apcluster” is used in original publication of network fingerprint (Cui et al. 2015).
                                IsoRank XXXXXXXX. SPINALXXXXX. GHOST XXXXXX.<br>
                                <span class='titleIndex'>What basic networks should I select from library in NFS analysis?</span><br>
                                &emsp;NFS is knowledge-based computational framework to decipher biomedical networks by making systematic comparisons to well-studied “basic networks”.
                                The fingerprints of biomedical networks is only meaningful under context of specific “basic networks”. The choice of basic networks totally depends on users’
                                research interest and topics. In general, we recommend user to browse “Resource” page and find the most appropriate basic network set before start NFS analysis.
                                All basic network sets in library are manually extracted from public databases, including KEGG pathway database, reactome, nci, panther, humancyc, spike(加链接xxxx).<br>
                            </p>
                        </div>
                    </div>
					<div id="citationbodyA" style="height: 400px;">
                        <div class="titleIndex">Citation</div>
                        <div class="contentIndex">
                            <p>
                                if you will find the results produced by NFS useful, please cite:<br>
                                Cui X, He H, He F, Wang S, Li F, Bo X. Network fingerprint: a knowledge-based characterization of biomedical networks.
                                Scientific Reports. 2015 Aug 26;5:13286. doi: 10.1038/srep13286. PubMed PMID: 26307246; PubMed Central PMCID: PMC4549786
                                <br>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div></div>
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