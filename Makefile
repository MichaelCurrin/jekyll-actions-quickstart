default: install

h help:
	@grep '^[a-z]' Makefile

install:
	bundle config set --local path vendor/bundle
	bundle install

s serve:
	cd sample_site && \
		bundle exec jekyll serve --destination ../build/ --trace --livereload

.PHONY: build
build:
	cd sample_site && \
		JEKYLL_ENV=production bundle exec jekyll build -d ../build --trace
