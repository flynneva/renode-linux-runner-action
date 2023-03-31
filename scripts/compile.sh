#!/bin/sh

git clone --branch 2022.11.2 https://github.com/buildroot/buildroot buildroot

cd buildroot && \
make BR2_EXTERNAL=../br2-external hifive_unleashed_defconfig && \
make -j$(nproc)

cd ..

if [ -d images ]; then
    echo directory images can not exist!
    exit 1
fi

mkdir images
for i in hifive-unleashed-a00.dtb fw_payload.elf Image rootfs.cpio; do
    cp buildroot/output/images/$i images;
done

tar cJvf images.tar.xz images