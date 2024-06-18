
.PHONY: astro
astro:
	npm create astro@latest -- --template framework-vue


.PHONY: tailwind
tailwind:
	cd .museum && npx astro add tailwind


.PHONY: serve
serve:
	cd .museum && npm run dev -- --host


.PHONY: build
build:
	cd .museum && npx astro build


.PHONY: qr-encode
qr-encode:
	qrencode -t svg -l H -o artifacts/Quo2HooKeereish7uzoquoaz/qr-code.svg https://jakegatsby.github.io/artifact.html?id=Quo2HooKeereish7uzoquoaz
