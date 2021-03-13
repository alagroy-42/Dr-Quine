# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alagroy- <alagroy-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 15:24:02 by alagroy-          #+#    #+#              #
#    Updated: 2021/03/15 12:24:41 by alagroy-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = $(COLLEEN) $(GRACE) $(SULLY)

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

CC = clang
CFLAGS = -Wall -Werror -Wextra

SRC_DIR = ./srcs/

SRCC = $(SRC_DIR)$(COLLEEN).c
SRCG = $(SRC_DIR)$(GRACE).c
SRCS = $(SRC_DIR)$(SULLY).c

TRASH_FILES = Grace_kid.c Sully_4.c Sully_4 Sully_3.c Sully_3 Sully_2.c \
				Sully_2 Sully_1.c Sully_1 Sully_0.c Sully_0

all: $(NAME)

$(COLLEEN): $(SRCC)
	$(CC) $(CFLAGS) $< -o $@

$(GRACE): $(SRCG)
	$(CC) $(CFLAGS) $< -o $@

$(SULLY): $(SRCS)
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(TRASH_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all

tests: $(NAME)
	./Grace; diff srcs/Grace.c Grace_kid.c
	./Colleen > Colleen.diff ; diff srcs/Colleen.c Colleen.diff
	./Sully ; diff Sully_0.c srcs/Sully.c || true

.PHONY: all fclean clean
