
apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
ca-certificates \
git \
wget && \
apt-get autoclean && apt-get clean && apt-get autoremove -y && \
update-ca-certificates && \
rm -rf /var/lib/apt/lists/*

apt update -qq