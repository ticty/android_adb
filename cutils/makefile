#
# Makefile For libzipfile
# suggestions please mail to dev.guofeng@gmail.com
#

TARGET = libcutils.a

SRCS = array.c \
	   hashmap.c \
	   atomic.c \
	   native_handle.c \
	   buffer.c \
	   socket_inaddr_any_server.c \
	   socket_local_client.c \
	   socket_local_server.c \
	   socket_loopback_client.c \
	   socket_loopback_server.c \
	   socket_network_client.c \
	   sockets.c \
	   config_utils.c \
	   cpu_info.c \
	   load_file.c \
	   list.c \
	   open_memstream.c \
	   strdup16to8.c \
	   strdup8to16.c \
	   record_stream.c \
	   process_name.c \
	   properties.c \
	   qsort_r_compat.c \
	   threads.c \
	   sched_policy.c \
	   iosched_policy.c \
	   str_parms.c \
	   ashmem-host.c \
	   dlmalloc_stubs.c

OBJS = $(patsubst %.c, %.o, $(SRCS))

LOCAL_CFLAGS = -DANDROID_SMP=0 -DHAVE_PTHREADS -DHAVE_SYS_UIO_H

IDIR = -I. \
       -I..


all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) -rcs "$@" $(OBJS)

%o: %c
	$(CC) $(IDIR) $(CFLAGS) $(LOCAL_CFLAGS) -c "$<" -o "$@"

clean:
	$(RM) $(OBJS) $(TARGET)


.PHONY: clean all

