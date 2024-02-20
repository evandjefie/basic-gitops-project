#!/usr/bin/env bash

# java jdk17
#echo "(1): Install JAVA JDK17"
#sudo apt-get install -y openjdk-17-jdk

#nodejs
#echo "(2): Install NODE 16"
#curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
#sudo apt-get install -y nodejs
#node -v && npm -v
#sleep 3

# trivy
#echo "(3): Install TRIVY"
#sudo apt-get install wget apt-transport-https gnupg lsb-release -y
#wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
#echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
#sudo apt-get update
#sudo apt-get install trivy -y
#trivy --version
#sleep 3

# sonnar-scan
#echo "(4): Install SONNAR-SCAN"
#wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
#unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt
#sudo rm /opt/sonar-scanner-cli-4.6.2.2472-linux.zip
#export PATH="/opt/sonar-scanner-4.6.2.2472-linux/bin:${PATH}"
#sleep 3


# echo "Create docker network"
docker network create vmjks

# #sonarqube docker
# echo "(5): Install SONARQUBE DOCKER"
# sudo apt-get update
# sudo usermod -aG docker jenkins  
# sudo usermod -aG docker ubuntu
# # docker run -d --name sonar -p 9000:9000 
# docker run -d \
#   -p 9000:9000 \
#   --privileged \
#   --network vmjks \
#   --name sonar_vmjks \
#   sonarqube:lts-community


jenkins docker
echo "(6): Install JENKINS DOCKER"
mkdir jenkins_srv && cd jenkins_srv
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --privileged \
  --network vmjks \
  -v $(pwd)/jenkins-data:/var/jenkins_home \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
#   -v /usr/bin/node:/usr/bin/node \
#   -v /usr/local/bin/trivy:/usr/local/bin/trivy \
#   -v /usr/local/bin/sonar-scanner:/usr/local/bin/sonar-scanner \
#   -v /usr/local/bin/kubectl:/usr/local/bin/kubectl \
#   -v /usr/local/bin/helm:/usr/local/bin/helm \
   --name jenkins_vmjks \
   jenkins/jenkins:latest

#echo "(): Install docker-compose"
#sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#docker-compose --version



echo "WELL DONE (-_-) at jenkins vm!"