#SHELL := /bin/bash

BUILD_DIR = build
SRC_DIR = src
CODE_DIR=build/code
DOC_DIR=build/docs
PWD=$(shell pwd)
EXIT_FILE=${PWD}/exit.txt
STATUS=0

all: build


init: 
	./init.sh

build: init
	make -f tangle-make -k all
	rsync -rav src/implementation/labs.json build/code/implementation
	sudo rm -rf /var/www/html/*

clean:	
	make -f tangle-make clean
