#!/bin/bash

# Install sshpass
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        apt-get install -y sshpass
elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
elif [[ "$OSTYPE" == "cygwin" ]]; then
        echo "POSIX compatibility layer and Linux environment emulation for Windows"
elif [[ "$OSTYPE" == "msys" ]]; then
        echo "Lightweight shell and GNU utilities compiled for Windows (part of MinGW)"
elif [[ "$OSTYPE" == "win32" ]]; then
        echo "I'm not sure this can happen."
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "freebsd"
else
        echo "Unknown"
fi

mkdir tools/
wget -q --no-check-certificate https://$NTNX_IP:9440/console/downloads/ncli.zip -O tools/ncli.zip
sshpass -p $NTNX_PASSWORD scp $NTNX_USERNAME@$NTNX_IP:/usr/local/nutanix/bin/acli tools/
sshpass -p $NTNX_PASSWORD scp $NTNX_USERNAME@$NTNX_IP:/usr/local/nutanix/bin/nuclei tools/
docker build . -t obaycloud/docker-nutanix-cli-tools:latest
docker push obaycloud/docker-nutanix-cli-tools:latest