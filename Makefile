# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomkrueger <tomkrueger@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/27 22:03:08 by tjensen           #+#    #+#              #
#    Updated: 2021/12/29 01:53:04 by tomkrueger       ###   ########.fr        #
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

.PHONY: all libmake $(SERVER) $(CLIENT) clean fclean re debug

all: libmake server client

server: 
	$(CC) $(CFLAGS) -o $(SERVER) $(SSRCS) $(LIB) $(INC)

client: 
	$(CC) $(CFLAGS) -o $(CLIENT) $(CSRCS) $(LIB) $(INC)

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
