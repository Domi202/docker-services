.PHONY: test

test:
	-docker build php/5.6
	-docker build php/7.0
	-docker build php/7.1
	-docker build php/7.2