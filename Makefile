.PHONY: serve
serve:
	cd src && hugo server -D --disableFastRender


.PHONY: build
build:
	rm artifacts/ categories/ css/ favicon.ico index.* sitemap.xml tags/ -r
	cd src && hugo -d ../


.PHONY: qr-encode
qr-encode:
	qrencode -t svg -l H -o artifacts/Quo2HooKeereish7uzoquoaz/qr-code.svg https://jakegatsby.github.io/artifact.html?id=Quo2HooKeereish7uzoquoaz
