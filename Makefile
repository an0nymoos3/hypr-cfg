# Makefile

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Werror

# Source directory
SRC_DIR = src

# Target executable
TARGET = hypr-cfg

# Get a list of all .c files in the src directory
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)

# Object files derived from source files
OBJ_FILES = $(SRC_FILES:.c=.o)

# GTK flags
GTK_FLAGS = $(shell pkg-config --cflags --libs gtk+-3.0)

# Build target
$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) $(GTK_FLAGS) -o $@ $^

# Rule to compile .c files to .o files
%.o: %.c
	$(CC) $(CFLAGS) $(GTK_FLAGS) -c -o $@ $<

# Clean rule
clean:
	rm -f $(OBJ_FILES) $(TARGET)
