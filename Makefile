help:
	@egrep '(^\S)|^$$' Makefile

install:
	bundle install --path vendor/bundle

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve --livereload --source sample_site
