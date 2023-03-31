apt-get update -qq && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        ca-certificates \
        git \
        wget \
        bc \
        bzip2 \
        cpio \
        file \
        g++ \
        make \
        patch \
        rsync \
        unzip \
        python \
        python3-dev \
        telnet \
        iproute2 \
        iptables && \
        apt-get autoclean && apt-get clean && apt-get autoremove -y && \
        update-ca-certificates

git clone --branch 2022.11.2 https://github.com/buildroot/buildroot buildroot

cd buildroot && \
make BR2_EXTERNAL=../renode-linux-runner-docker/br2_external hifive_unleashed_defconfig && \
make && \
cd .. && \
mkdir -p images && \
cp buildroot/output/images/{hifive-unleashed-a00.dtb fw_payload.elf Image rootfs.cpio} images

wget https://github.com/renode/renode/releases/download/v1.13.0/renode_1.13.0_amd64.deb

apt-get install ./renode_1.13.0_amd64.deb

yes | rm -rf buildroot renode_1.13.0_amd64.deb images