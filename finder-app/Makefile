CC=gcc
CC_OPT=-g -Wall
OUT=writer

.phony: clean

$(OUT): writer.c
	$(CROSS_COMPILE)$(CC) $(CC_OPT) -o $(OUT) writer.c
	chmod +x $(OUT)

clean:
	$(RM) $(OUT)