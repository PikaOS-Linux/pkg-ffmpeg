# Clone Upstream
git clone https://github.com/FFmpeg/FFmpeg -b release/6.0
cp -rvf ./debian ./FFmpeg
mv ./FFmpeg ./ffmpeg
cd ./ffmpeg

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p ffmpeg_6.0.0
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
