CFLAGS=-O6 -march=native

all: var-st var-mt VarMT.class

var-st: var-st.cpp
	c++ $(CFLAGS) -o $@ $<

var-mt: var-mt.cpp
	c++ $(CFLAGS) -lpthread -o $@ $<

VarMT.class: VarMT.java
	javac $<
