#!/bin/bash
 
config=$(cat)                                                   
 
secretName=$(echo "$config" | yq e '.functionConfig.metadata.name' - ) 
 
keyName=$(echo "$config" | yq e '.functionConfig.spec.keyName' - )   
 
 
password="Pa55w0rd!"                                                
 
 
base64password=$(echo -n $password | base64)                        
 
 
echo "                                                              
kind: Secret
apiVersion: v1
metadata:
  name: $secretName
data:
  $keyName: $base64password
"