#
# Makefile For libzipfile
# suggestions please mail to dev.guofeng@gmail.com
#

TARGET = libzipfile.a

SRCS = centraldir.c \
       zipfile.c

OBJS = $(patsubst %.c,%.o,$(SRCS))

IDIR = -I..


all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) -rcs "$@" $(OBJS)

%o: %c
	$(CC) $(IDIR) $(CFLAGS) -c "$<" -o "$@"

clean:
	$(RM) $(OBJS) $(TARGET)


.PHONY: clean all

