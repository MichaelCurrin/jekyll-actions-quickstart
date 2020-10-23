default: install

h help:
	@egrep '^\S|^$$' Makefile

install:
	bundle config set --local path vendor/bundle
	bundle install

s serve:
	bundle exec jekyll serve --source sample_site --destination build/ --livereload --trace

build:
	JEKYLL_ENV=production bundle exec jekyll build --trace
