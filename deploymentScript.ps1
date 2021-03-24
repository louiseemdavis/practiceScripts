#deployment script for Ubuntu 18.04 web server with apache2
#create new group to begin
az group create --name "myFinalGroup" --location "westeurope" 

#create new vm with ubuntu
az vm create --image UbuntuLTS --admin-username "louise" --generate-ssh-keys --resource-group "myFinalGroup" --location "westeurope" --name "myFinalVM" --size "Standard_B1s"

#open port 80 so that it can host a web site
az vm open-port --port 80 --priority 300 --resource-group "myFinalGroup" --name "myFinalVM"

#use extension to push commands to update and install apache2
az vm run-command invoke -g myFinalGroup -n myFinalVM --command-id RunShellScript --scripts "sudo apt-get update && sudo apt-get install -y apache2"
