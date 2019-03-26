export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump --assume-yes
apt install -y curl --assume-yes
ip addr add 10.0.10.1/24 dev eth1
ip link set eth1 up
ip route add 10.0.0.0/8 via 10.0.10.254
clear
echo "End of HOST-1-A"
