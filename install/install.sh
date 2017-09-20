echo Downloading and installing commandos app...
curl -L https://github.com/BDCraven/commandos/archive/1.0.tar.gz | tar vzx
echo ...DONE
echo "export PATH=\$PATH:$PWD/commandos-1.0/bin" >> ~/.bash_profile
