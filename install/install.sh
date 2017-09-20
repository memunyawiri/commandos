echo Downloading and installing commandos app...
VER=1.3
curl -L https://github.com/BDCraven/commandos/archive/$VER.tar.gz | tar vzx
echo ...DONE
echo "export PATH=\$PATH:$PWD/commandos-$VER/bin" >> ~/.bash_profile
