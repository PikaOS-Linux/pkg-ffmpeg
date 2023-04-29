# Pull down existing ppa repo db files etc
mkdir -p ./output/repo
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% ffmpeg*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavcodec60*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavdevice60*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavfilter9*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavformat60*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavutil58*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libpostproc57*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libswresample4*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libswscale7*)'

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
