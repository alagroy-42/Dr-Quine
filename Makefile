# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alagroy- <alagroy-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 15:24:02 by alagroy-          #+#    #+#              #
#    Updated: 2021/03/11 15:52:06 by alagroy-         ###   ########.fr        #
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

$(COLLEEN): $(SRCC)
	$(CC) $(CFLAGS) $< -o $@

$(GRACE): $(SRCG)
	$(CC) $(CFLAGS) $< -o $@

$(SULLY): $(SRCS)
	$(CC) $(CFLAGS) $< -o $@
