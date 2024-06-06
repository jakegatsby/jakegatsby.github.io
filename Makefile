


.PHONY: serve
serve:
	python3 -m http.server --bind 0.0.0.0


.PHONY: encode-audio
encode-audio:
	echo fdkaac -p5 -b64 audio.wav  # FIXME
