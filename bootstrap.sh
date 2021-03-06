# Swap out default Ubuntu mirror for a hopefully faster one
sed -i.bak 's/archive.ubuntu.com/mirrors.rit.edu/' /etc/apt/sources.list

# Install wget
apt-get update && apt-get install --assume-yes \
    python3 \
    wget

# Install LaTeX
python3 /vagrant/install-texlive-without-docs.py

# # Install Docker
# wget -qO- https://get.docker.com/ | sh
# docker run hello-world
#
# # Add vagrant user to docker
# #   https://docs.oracle.com/cd/E52668_01/E54669/html/section_rdz_hmw_2q.html
# groupadd docker
# service docker restart
# usermod -a -G docker vagrant
