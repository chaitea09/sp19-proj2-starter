Flags=-Wall -g -std=c99
LinkingInfo=-L/home/ff/cs61c/bin/static -l61Ccc-notcgen


61ccc : main.o cgen.o instructions.o cgen-helpers.o
	gcc $(Flags) -o 61ccc main.o cgen.o instructions.o cgen-helpers.o $(LinkingInfo)

main.o : main.c cgen.h cgen-helpers.h
	gcc $(Flags) -c main.c $(LinkingInfo)

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
