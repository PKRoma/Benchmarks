all: var-st var-mt VarMT.class

var-st: var-st.cpp
	c++ -O6 -march=native -o $@ $<

var-mt: var-mt.cpp
	c++ -O6 -march=native -lpthread -o $@ $<

VarMT.class: VarMT.java
	javac $<
