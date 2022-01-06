# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkruger <tkruger@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/27 22:03:08 by tjensen           #+#    #+#              #
#    Updated: 2022/01/06 00:48:59 by tkruger          ###   ########.fr        #
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

LIBDIR		:= lib/ft_printf
FT_PRINTF	:= libftprintf.a


# **************************************************************************** #
#	RULES																	   #
# **************************************************************************** #

.PHONY: all libmake server client clean fclean re debug

all: libmake server client

server: 
	$(CC) $(CFLAGS) -o $(SERVER) $(SSRCS) $(LIBDIR)/$(FT_PRINTF)

client: 
	$(CC) $(CFLAGS) -o $(CLIENT) $(CSRCS) $(LIBDIR)/$(FT_PRINTF)

libmake:
	@make -C $(LIBDIR) all

clean:
	@rm -f *.o *~
	@make -C $(LIBDIR) clean

fclean:	clean
	@rm -f $(CLIENT)
	@rm -f $(SERVER)
	@rm -f $(LIBDIR)/libftprintf.a

re:	fclean all
