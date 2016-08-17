
JISON = jison

all: clean parser.js

clean:
		@echo "Cleaning......."
		@ rm -rf ./src/parser.js

parser.js: grammar/parser.jison grammar/lexer.jisonlex
					@echo "Generating nova parser"
					${JISON} $^ -o src/$@


.PHONY: clean
