update:
	V=$$(curl --silent https://dl.ui.com/unifi/debian/dists/stable/ubiquiti/binary-amd64/Packages.gz |zgrep '^Version:' | sed 's/\s//; s/.*://; s/-.*//') && \
	  sed -i "/VERSION=/ s/=.*/=$${V}/" Dockerfile

version:
	@grep 'VERSION=' Dockerfile | sed 's/.*=//'
