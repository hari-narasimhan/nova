all: clean build

clean:
	@echo "removing parser.js"
	@ rm -rf ./src/parser.js

build:
					@echo "creating the nova parser"
					@echo "building parser"
					@ jison ./grammar/parser.jison ./grammar/lexer.jisonlex -o ./src/parser.js


.PHONY: clean build
