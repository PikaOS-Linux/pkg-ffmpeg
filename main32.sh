# Clone Upstream
git clone https://github.com/FFmpeg/FFmpeg -b release/6.0
cp -rvf ./debian ./FFmpeg
mv ./FFmpeg ./ffmpeg
cd ./ffmpeg

for i in ../patches/* ; do patch -Np1 -i $i; done

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
