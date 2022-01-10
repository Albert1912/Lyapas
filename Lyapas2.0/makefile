
lyapas: src/lyapas.l files stack common lex arrays fixed_size_array syntax_table llparser rules table syntax_handler syntax_handler_utils tree tree_extensions byte_code_producer
	./ltc src/lyapas.l -o build/lyapas obj/files.o obj/stack.o obj/common.o obj/lex.o obj/arrays.o obj/fixed_size_array.o obj/syntax_table.o obj/llparser.o obj/get_rules.o obj/get_table.o obj/syntax_handler.o obj/syntax_handler_utils.o obj/tree.o obj/tree_extensions.o obj/byte_code_producer.o

llparser: src/llparser.l
	./ltc -c src/llparser.l -o obj/llparser

lex: src/lex.l
	./ltc -c src/lex.l -o obj/lex

arrays: src/arrays.l
	./ltc -c src/arrays.l -o obj/arrays

tree: src/tree.l
	./ltc -c src/tree.l -o obj/tree

byte_code_producer: src/byte_code_producer.l
	./ltc -c src/byte_code_producer.l -o obj/byte_code_producer

tree_extensions: src/tree_extensions.l
	./ltc -c src/tree_extensions.l -o obj/tree_extensions

fixed_size_array: src/fixed_size_array.l
	./ltc -c src/fixed_size_array.l -o obj/fixed_size_array

syntax_table: src/syntax_table.l
	./ltc -c src/syntax_table.l -o obj/syntax_table

syntax_handler: src/syntax_handler.l
	./ltc -c src/syntax_handler.l -o obj/syntax_handler

syntax_handler_utils: src/syntax_handler_utils.l
	./ltc -c src/syntax_handler_utils.l -o obj/syntax_handler_utils

rules: src/get_rules.l
	./ltc -c src/get_rules.l -o obj/get_rules

table: src/get_table.l
	./ltc -c src/get_table.l -o obj/get_table

common: src/common.l
	./ltc -c src/common.l -o obj/common

files: src/files.l
	./ltc -c src/files.l -o obj/files

stack: src/stack.l
	./ltc -c src/stack.l -o obj/stack

clean:
	rm -f obj/* build/* src/*.err
