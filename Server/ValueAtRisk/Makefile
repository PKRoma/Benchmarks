all: var-st var-mt VarMT.class

var-st: var-st.cpp
	c++ -O6 -o $@ $<

var-mt: var-mt.cpp
	c++ -O6 -lpthread -o $@ $<

VarMT.class: VarMT.java
	javac $<
