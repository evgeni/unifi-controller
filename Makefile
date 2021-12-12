update:
	V=$$(curl --silent https://dl.ubnt.com/unifi/debian/dists/stable/ubiquiti/binary-amd64/Packages |grep '^Version:' | sed 's/\s//; s/.*://; s/-.*//') && \
	  sed -i "/VERSION=/ s/=.*/=$${V}/" Dockerfile
