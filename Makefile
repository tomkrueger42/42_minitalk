# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkruger <tkruger@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/27 22:03:08 by tjensen           #+#    #+#              #
#    Updated: 2022/01/06 00:33:11 by tkruger          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#	Project specific														   #
# **************************************************************************** #

SERVER		:= server
CLIENT		:= client

SSRCS		:= src/server.c
CSRCS		:= src/client.c

# **************************************************************************** #
#	GENERAL VARIABLES														   #
# **************************************************************************** #

CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror

FT_PRINTF	:= cd lib/ft_printf && make
LIB			:= lib/libftprintf.a


# **************************************************************************** #
#	RULES																	   #
# **************************************************************************** #

.PHONY: all libmake server client clean fclean re debug

all: libmake server client

server: 
	$(CC) $(CFLAGS) -o $(SERVER) $(SSRCS)

client: 
	$(CC) $(CFLAGS) -o $(CLIENT) $(CSRCS)

libmake:
	@make -C $(LIBDIRS) all
	@make -C $(LIBDIRS) clean

clean:
	@rm -f *.o *~
	@make -C $(LIBDIRS) clean

fclean:	clean
	@rm -f $(CLIENT)
	@rm -f $(SERVER)
	@rm -f $(LIBDIRS)/ft_printf.a

re:	fclean all
