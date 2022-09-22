tar_url=`curl -H "Accept: application/vnd.github+json" https://api.github.com/repos/dsayling/outlook-sound-sync/releases/latest | python3 -c "import sys, json; print(json.load(sys.stdin)['tarball_url'])"`
mkdir -p /tmp/oss/extracted

wget "$tar_url" -O /tmp/oss/outlook-sound-sync.tar.gz
tar -xvf /tmp/oss/outlook-sound-sync.tar.gz --strip-components 1 -C /tmp/oss/extracted
sh -c "/tmp/oss/extracted/src/install-outlook-sync.sh"
