
# 0. Download planet
# sudo apt install -y transmission-cli
wget http://ftp.snt.utwente.nl/pub/misc/openstreetmap/planet-latest.osm.pbf
# transmission-cli  https://planet.openstreetmap.org/pbf/planet-230102.osm.pbf.torrent



# 1. Docker
sudo apt-get update
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker ${USER}

# 2. Java JDK

sudo apt install -y openjdk-17-jdk-headless 

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64/

# 3. Planetiler

# screen usage:
# screen
# QuickStart.. etc.
# ctrl-a d
# to resume:
# screen -r

git clone https://github.com/asianrider/planetiler.git
cd planetiler
git checkout v0.1

# 4. tileserver

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs
sudo apt install npm
sudo npm install -g tileserver-gl-light

tileserver-gl-light --config config.json
