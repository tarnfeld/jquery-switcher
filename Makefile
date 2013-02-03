BUILD_DIR = "./example"
BIN_DIR = "./node_modules/.bin"
JS_SRC = "./src/js"
LESS_SRC = "./src/less"

all: dependencies clean build

# Install Dependencies
dependencies:
	npm install

# Clean
clean: clean-less clean-js

clean-less:
	rm -rf $(BUILD_DIR)/css

clean-js:
	rm -rf $(BUILD_DIR)/js

# Build
build: build-less build-js

build-less:
	mkdir -p $(BUILD_DIR)/css
	find $(LESS_SRC)/*.less -type f | xargs -I{} bash -c '$(BIN_DIR)/lessc --yui-compress -x {} > $(BUILD_DIR)/css/`basename {} | sed s/less/css/`'

build-js:
	mkdir -p $(BUILD_DIR)/js
	find $(JS_SRC)/*.js -type f | xargs -I{} bash -c '$(BIN_DIR)/yuicompressor -o $(BUILD_DIR)/js/`basename {} | sed s/\.js/.min.js/` {}'
