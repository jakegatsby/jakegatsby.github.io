.PHONY: serve
serve:
	cd src && rm public/ -rf && hugo server --debug -D --disableFastRender --bind 0.0.0.0


.PHONY: clean
clean:
	rm about/ displays/ artifacts/ categories/ contact/ css/ news/ tags/ favicon.ico index.* sitemap.xml -rf

.PHONY: build
build:
	if grep -q draft src/content; then echo "Remove draft" && exit 1; fi

	cd src && hugo -d ../


.PHONY: qr-encode
qr-encode:
	qrencode -t svg -l H -o jakegatsby.github.io.svg https://jakegatsby.github.io/
	qrencode -t png -l H -s 10 -o jakegatsby.github.io.png https://jakegatsby.github.io/

