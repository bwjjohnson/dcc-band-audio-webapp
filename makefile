default: download
	

clean:
	rm -rf build

download: build/band.html
	

build/band.html:
	mkdir -p build; curl --silent http://media.downtowncornerstone.org/band.html > build/band.html

diff: build/band.html
	diff -s band.html build/band.html

deploy: build/band.html
	aws s3 cp band.html s3://media.downtowncornerstone.org/band.html --region us-west-2
