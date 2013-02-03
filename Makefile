BUILD_DIR = "./example"
BIN_DIR = "./node_modules/.bin"
JS = "./src/js"
LESS = "./src/less"

all: dependencies build

dependencies:
	npm install

build: build-less build-js

build-less:
	echo $(BIN_DIR)/lessc \
		--yui-compress \
		$(LESS)/*.less \
		$(BUILD_DIR)/css

build-js:
	echo "ho"
