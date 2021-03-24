# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alagroy- <alagroy-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 15:24:02 by alagroy-          #+#    #+#              #
#    Updated: 2021/03/24 12:13:25 by alagroy-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = $(CNAME) $(ASMNAME)


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

SULLY_TRASH_FILES = Sully_0 Sully_1 Sully_2 Sully_3 Sully_4
SULLY_TRASH = $(addprefix $(CDIR), $(SULLY_TRASH_FILES)) \
				$(addprefix $(CDIR), $(addsuffix .o, $(SULLY_TRASH_FILES))) \
				$(addprefix $(CDIR), $(addsuffix .c, $(SULLY_TRASH_FILES))) \
				$(addprefix $(ASMDIR), $(SULLY_TRASH_FILES)) \
				$(addprefix $(ASMDIR), $(addsuffix .o, $(SULLY_TRASH_FILES))) \
				$(addprefix $(ASMDIR), $(addsuffix .s, $(SULLY_TRASH_FILES))) \
				$(addprefix $(PHPDIR), $(addsuffix .php, $(SULLY_TRASH_FILES)))

TRASH_FILES = ./c/Grace_kid.c ./asm/Grace_kid.s ./php/Grace_kid.php \
				./c/Colleen.diff ./asm/Colleen.diff ./php/Colleen.diff $(OBJS) \
				$(SULLY_TRASH)


all: $(DIRS) $(NAME)

$(CDIR)%: $(SRC_DIR)%.c
	$(CC) $(CFLAGS) $< -o $@

$(ASMDIR)%: $(SRC_DIR)%.s
	$(ASM) $< -o $@.o
	$(LD) $@.o -o $@

$(DIRS):
	mkdir -p $(CDIR) $(ASMDIR)

clean:
	rm -f $(TRASH_FILES)

fclean: clean
	rm -rf $(CDIR) $(ASMDIR)

re: fclean all

tests: $(NAME)
	./test.sh

.PHONY: all fclean clean
