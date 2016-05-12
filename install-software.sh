# install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y

# install nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo bash -
sudo apt-get update
sudo apt-get install build-essential nodejs -y

# install docker 
apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install apparmor -y
sudo apt-get install docker-engine -y
sudo usermod -aG docker vagrant

# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install aws cli
VAGRANT_HOME=/home/vagrant
TMP=${VAGRANT_HOME}/tmp
TMP_AWSCLI=${TMP}/aws-cli-bundle
mkdir -p $TMP_AWSCLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "${TMP_AWSCLI}/awscli-bundle.zip"
unzip ${TMP_AWSCLI}/awscli-bundle.zip -d /${TMP_AWSCLI}
sudo ${TMP_AWSCLI}/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
