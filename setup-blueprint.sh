# install go 1.23.1
sudo su royno7
wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz
sudo tar -xvf go1.23.1.linux-amd64.tar.gz -C /usr/local
rm go1.23.1.linux-amd64.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile

# Install docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo service docker start 
sudo systemctl start docker

#install grpc
sudo apt install -y protobuf-compiler

go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.36.5
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.5.1

echo 'export PATH="$PATH:$(go env GOPATH)/bin"'>>~/.profile
source ~/.profile

# setup blueprint
cd /usr/royno7
git clone https://github.com/Blueprint-uServices/blueprint.git
cd blueprint
git reset --hard 061b4fb3d09f29b1273487f2657b6fbea0ac1065

