
.PHONY: nuxt
nuxt:
	@echo select YARN as package manager
	@echo
	npx nuxi@latest init museum
	cd museum && yarn
	cd museum && yarn add -D vuetify vite-plugin-vuetify
	cd museum && yarn add @mdi/font


.PHONY: serve
serve:
	cd museum && yarn run dev


.PHONY: qr-encode
qr-encode:
	qrencode -t svg -l H -o artifacts/Quo2HooKeereish7uzoquoaz/qr-code.svg https://jakegatsby.github.io/artifact.html?id=Quo2HooKeereish7uzoquoaz
