#!/bin/bash
# This is a simple Bash script
sudo apt update

sudo apt install -y golang-go git curl unzip python3 python3-pip

# Install Sublist3r if not already installed
if [ ! -d "Sublist3r" ]; then
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r
    pip3 install -r requirements.txt
    cd ..
fi

# Install Subfinder
if ! command -v subfinder &> /dev/null; then
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    export PATH=$PATH:$(go env GOPATH)/bin
fi

# Install Assetfinder
if ! command -v assetfinder &> /dev/null; then
    go install -v github.com/tomnomnom/assetfinder@latest
fi

# Install Amass
if ! command -v amass &> /dev/null; then
    sudo snap install amass
fi

# Install Findomain
if ! command -v findomain &> /dev/null; then
    wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
    unzip findomain-linux.zip
    chmod +x findomain
    sudo mv findomain /usr/local/bin/
fi

# Install httpx
if ! command -v httpx &> /dev/null; then
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
fi

# Install Aquatone
if ! command -v aquatone &> /dev/null; then
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
    unzip aquatone_linux_amd64_1.7.0.zip
    chmod +x aquatone
    sudo mv aquatone /usr/local/bin/
fi

echo "Enter a domain name:" 
read domain
echo "Running Sublit3r on $domain "
sublist3r -d $domain -o "sublist3r.txt"
echo "Running Subfinder on $domain "
subfinder -d $domain -o "subfinder.txt" 
echo "Running Assetfinder on $domain "
assetfinder --subs-only $domain >> "assetfinder.txt"
echo "Running Amass on $domain "
amass enum -d $domain -o "amass.txt"
echo "Running Findomain on $domain "
findomain -t $domain >> findomain.txt

cat sublist3r.txt subfinder.txt assetfinder.txt amass.txt finddomain.txt> total.txt

grep -oE '\b([a-zA-Z0-9_-]+\.)+yahoo\.com\b' total.txt | sort -u > sortedfinal.txt

cat raza.txt | httpx -silent -o live.txt 

echo "Your final Txt file is live.txt"
cat live.txt | aquatone

