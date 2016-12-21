#!/bin/bash
echo spinal script start!
sed 's/\"//g' ./data/hsapi/net1.tab | awk '{print $2,$3}' | grep -v V2 > ./data/hsapi/net1_clean.tab  
sed 's/\"//g' ./data/hsapi/net2.tab | awk '{print $2,$3}' | grep -v V2 > ./data/hsapi/net2_clean.tab
  
python ./pyscripts/data_generation.py ./data/hsapi/net1_clean.tab ./data/hsapi/net2_clean.tab ./data/hsapi/entrez-entrez_from_isorank.evals
./spinal.exe -II -ns ./data/hsapi/net1_clean.tab.gml ./data/hsapi/net2_clean.tab.gml ./data/hsapi/entrez-entrez_from_isorank.evals.pin ./data/hsapi/net1_net2_spinal.txt 0.7
python ./pyscripts/spinal_original_names.py ./data/hsapi/net1_clean.tab.gml ./data/hsapi/net2_clean.tab.gml ./data/hsapi/net1_net2_spinal.txt ./data/hsapi/net1_net2_spinal_originalname.txt
# export cluster results
cat ./data/hsapi/net1_net2_spinal_originalname.txt | grep -v ! > ./data/hsapi/net1_net2_spinal_cluster.txt
echo spinal script finish!
