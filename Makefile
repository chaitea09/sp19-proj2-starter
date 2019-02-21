Flags=-Wall -g -std=c99
LinkingInfo=-L/home/ff/cs61c/bin/static -l61Ccc-notcgen


61ccc : main.o cgen.o instructions.o cgen-helpers.o
	gcc $(Flags) -o 61ccc main.o tokenizer.o tokenizer-errors.o tokens.o string-helpers.o utils.o parser.o parser-helpers.o parser-errors.o preprocessor.o ast.o ast-print.o dast.o dast-print.o decorate.o decorate-errors.o cgen.o instructions.o cgen-helpers.o

main.o : main.c cgen.h cgen-helpers.h
	gcc $(Flags) -c main.c

cgen.o: cgen.c cgen.h dast.h instructions.h cgen-helpers.h
	gcc $(Flags) -c cgen.c

cgen-helpers.o: cgen-helpers.h
	gcc $(Flags) -c cgen-helpers.c

instructions.o: instructions.c instructions.h
	gcc $(Flags) -c instructions.c
clean:
	rm *.o
	rm 61ccc

.PHONY: clean
