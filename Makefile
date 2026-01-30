NAME	= libasm.a

SRCS	= 	read.s \
			strcmp.s \
			strcpy.s \
			strdup.s \
			strlen.s \
			write.s

OBJS	= $(SRCS:%.s=%.o)

COMPILE	= nasm -f elf64

$(NAME): $(OBJS)
	ar -rc $(NAME) $(OBJS)

%.o: %.s
	$(COMPILE) $< -o $@

all: $(NAME)

clean:
	rm -rf *.o

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re