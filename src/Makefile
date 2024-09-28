
# FIXME
# slugify

.PHONY: install
install:
	# FIXME - install mkdocs and markdown in a venv

.PHONY: serve
serve:
	mkdocs serve -v --watch-theme -a 0.0.0.0:8000

.PHONY: mogrify
mogrify:
	find content/displays/ -name *.jpg -exec mogrify -resize 1200x800 -background black -gravity center -extent 1200x800 {} \;
