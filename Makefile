help:
	@egrep '(^\S)|^$$' Makefile

install:
	bundle install --path vendor/bundle

upgrade:
	bundle update
