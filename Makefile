.DELETE_ON_ERROR:
.SECONDARY:

all: picea-sitchensis-organelles-slides.html

clean:
	rm -f picea-sitchensis-organelles-slides.html

install-deps:
	brew install pandoc

%.html: %.md reveal.js/js/reveal.js
	pandoc -st revealjs -V theme:sky -o $@ $<

revealjs-3.3.0.tar.gz:
	curl -L -o $@ https://github.com/hakimel/reveal.js/archive/3.3.0.tar.gz

reveal.js-3.3.0/js/reveal.js: revealjs-3.3.0.tar.gz
	tar xf $<
	touch $@

reveal.js/js/reveal.js: reveal.js-3.3.0/js/reveal.js
	cp -a reveal.js-3.3.0 reveal.js
	sed -i .orig -e 's/text-transform: uppercase;//' reveal.js/css/theme/sky.css
	touch $@
