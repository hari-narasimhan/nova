clean:
	@echo "removing parser.js"
	@ rm -rf ./src/parser.js

default:
					@echo "creating the nova parser"
					@echo "building parser"
					@ jison ./grammar/parser.jison ./grammar/lexer.jisonlex -o ./src/parser.js
