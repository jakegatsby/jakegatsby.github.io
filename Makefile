.PHONY: serve
serve:
	cd src && hugo server -D --disableFastRender --bind 0.0.0.0


.PHONY: build
build:
	if grep -q draft src/content; then echo "Remove draft" && exit 1; fi
	rm about/ artifacts/ categories/ contact/ css/ news/ tags/ favicon.ico index.* sitemap.xml -rf
	cd src && hugo -d ../


.PHONY: qr-encode
qr-encode:
	qrencode -t svg -l H -o jakegatsby.github.io.svg https://jakegatsby.github.io/
	qrencode -t png -l H -s 10 -o jakegatsby.github.io.png https://jakegatsby.github.io/

