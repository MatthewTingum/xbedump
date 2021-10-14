CXX       = g++
OPT       = -O2
FLAGS     = $(OPT) -ansi -Wall -Wextra -pedantic


TOPDIR  := $(shell /bin/pwd)

THINGS =  giants.o xboxlib.o xbedump.o  xbevalidate.o main.o

all: clean xbe

%.o	: %.c
	${CXX} ${FLAGS} -o $@ -c $<

xbe: ${THINGS} ${CRYPTOLIB}
	${CXX} -o $@ -lm ${THINGS} -lcrypto
clean:
	-rm -f *.o  xbe core
