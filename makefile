#
# Makefile For fastboot
# bug or suggestion please mail to dev.guofeng@gmail.com
#

TARGET = adb


SRCS = adb.c \
	   console.c \
	   transport.c \
	   transport_local.c \
	   transport_usb.c \
	   commandline.c \
       adb_client.c \
	   sockets.c \
	   services.c \
	   file_sync_client.c \
	   get_my_path_linux.c \
       usb_linux.c \
	   utils.c \
	   usb_vendors.c \
	   fdevent.c

OBJS = $(patsubst %.c,%.o,$(SRCS))

LIBS = -lzipfile \
       -lcutils \
       -lrt \
       -lncurses \
       -lpthread \
       -lz

SUBDIR = zipfile \
         cutils

IDIR = -I. \
       -I./zipfile \
       -I./cutils

LDIR = -L./zipfile \
       -L./cutils

export CC = gcc
export CFLAGS = -O2 -Wall -W
export LFLAGS = 
export LIB_PATH_PREFIX = /usr/local/lib
export BIN_PATH_PREFIX = /usr/local/bin
export AR = ar
export RM = rm -f
export STRIP = strip
export INSTALL = install

LOCAL_CFLAGS = -DADB_HOST=1 -DHAVE_FORKEXEC -D_XOPEN_SOURCE -D_GNU_SOURCE


all: $(TARGET)

$(TARGET): $(OBJS) $(LIBS)
	$(CC) $(LFLAGS) $(LDIR) -o "$@" $(OBJS) $(LIBS)
	@echo ""
	@echo "### Build $@ finish ###"
	@echo ""

$(LIBS):
	@for dir in $(SUBDIR); \
	do \
		make all -C $$dir; \
	done

%.o: %.c
	$(CC) $(IDIR) $(CFLAGS) $(LOCAL_CFLAGS) -c "$<" -o "$@"

strip: $(TARGET)
	$(STRIP) $(TARGET)

install: permission $(TARGET)
	$(INSTALL) -g 0 -o 0 -m 4755 -Ds $(TARGET) $(BIN_PATH_PREFIX)/$(TARGET)
	@echo ""
	@echo "### Install $(TARGET) finish ###"
	@echo ""

uninstall: permission
	$(RM) $(BIN_PATH_PREFIX)/$(TARGET)
	@echo ""
	@echo "### Uninstall $(TARGET) finish ###"
	@echo ""

permission:
	@if [ `id -u` -ne 0 ];	\
	then	\
		echo "***Error: please run with root permission***";	\
		exit 1;	\
	else	\
		exit 0;	\
	fi

clean:
	$(RM) $(OBJS) $(TARGET)
	@for dir in $(SUBDIR); \
	do \
		make clean -C $$dir; \
	done


.PHONY: clean all strip

