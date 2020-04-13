help:
	@egrep '(^\S)|^$$' Makefile

install:
	bundle install --path vendor/bundle

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve --source sample_site --destination build/ --livereload --trace
