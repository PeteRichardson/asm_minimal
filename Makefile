TARGET = hello

SRC = $(TARGET).s
COPTS = -g -O0

$(TARGET): $(SRC)
	$(CC) $(COPTS) -o $@ $(SRC)

disasm: $(TARGET)
	r2 -qq -e log.level=1 -A -c "pdf @main ; px 32 @sym.hello" $(TARGET)

clean: 
	rm -f $(TARGET)
	rm -rf *.dSYM
	rm -f *.o

obj: $(SRC)
	as -o $(TARGET).o $(SRC)

.PHONY: clean
