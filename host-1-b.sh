export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump --assume-yes
apt install -y curl --assume-yes
ip addr add 10.0.20.1/27 dev eth1
ip link set eth1 up
ip route add 10.0.0.0/8 via 10.0.20.30
clear
echo "End of HOST-1-B"
