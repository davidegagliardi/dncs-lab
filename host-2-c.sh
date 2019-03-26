export DEBIAN_FRONTEND=noninteractive
apt-get update -y
#apt-get upgrade --assume-yes
apt-get install -y tcpdump --assume-yes
apt-get install -y apt-transport-https ca-certificates curl software-properties-common --assume-yes --force-yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce --assume-yes --force-yes
ip addr add 10.0.30.1/30 dev enp0s8
ip link set enp0s8 up
ip route add 10.0.0.0/8 via 10.0.30.2
docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker pull nginx
mkdir -p ~/docker-nginx/html
echo "<html>
<head><title>DNCS ASSIGNMENT</title></head>
<body>
<p>So long, and thanks for all the fish.<p>
</body>
</html>" > ~/docker-nginx/html/index.html
docker run --name docker-nginx -p 80:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx
clear
echo "End of HOST-2-C"
