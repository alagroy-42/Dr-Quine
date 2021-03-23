# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alagroy- <alagroy-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 15:24:02 by alagroy-          #+#    #+#              #
#    Updated: 2021/03/23 12:45:37 by alagroy-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = $(CNAME) $(ASMNAME) $(PHPNAME)


COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

CC = clang
CFLAGS = -Wall -Werror -Wextra
ASM = nasm -f macho64
LD = ld -arch x86_64 -macos_version_min 10.13 -lSystem

SRC_DIR = ./srcs/

FILES = $(COLLEEN) $(GRACE) $(SULLY)
DIRS = $(CDIR) $(ASMDIR) $(PHPDIR)

CDIR = ./c/
ASMDIR = ./asm/
PHPDIR = ./php/

CNAME = $(addprefix $(CDIR), $(FILES))
ASMNAME = $(addprefix $(ASMDIR), $(FILES))
PHPNAME = $(addprefix $(PHPDIR), $(FILES))

OBJS = $(addsuffix .o, $(ASMNAME))

CSRCS = $(addprefix $(SRC_DIR), $(addsufix $(FILES), .c))

TRASH_FILES = Grace_kid.c Sully_4.c Sully_4 Sully_3.c Sully_3 Sully_2.c \
				Sully_2 Sully_1.c Sully_1 Sully_0.c Sully_0 $(OBJS)

all: $(DIRS) $(NAME)

$(CDIR)%: $(SRC_DIR)%.c
	$(CC) $(CFLAGS) $< -o $@

$(ASMDIR)%: $(SRC_DIR)%.s
	$(ASM) $< -o $@.o
	$(LD) $@.o -o $@

$(DIRS):
	mkdir -p $(DIRS)

clean:
	rm -f $(TRASH_FILES)

fclean: clean
	rm -rf $(DIRS)

re: fclean all

tests: $(NAME)
	./Grace; diff srcs/Grace.c Grace_kid.c
	./Colleen > Colleen.diff ; diff srcs/Colleen.c Colleen.diff
	./Sully ; diff Sully_0.c srcs/Sully.c || true

.PHONY: all fclean clean
