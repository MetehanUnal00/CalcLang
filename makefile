CC = gcc
LEX = flex

TARGET = CalcLang
SRC = CalcLang.l

all: $(TARGET)

$(TARGET): lex.yy.c
	$(CC) -o $(TARGET) lex.yy.c -ll

lex.yy.c: $(SRC)
	$(LEX) $(SRC)

run-example: $(TARGET) example.clg
	./$(TARGET) < example.clg

clean:
	rm -f $(TARGET) lex.yy.c
