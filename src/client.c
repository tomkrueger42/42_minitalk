/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tkruger <tkruger@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/29 00:11:29 by tomkrueger        #+#    #+#             */
/*   Updated: 2022/01/06 00:29:12 by tkruger          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minitalk.h"

int	ft_atoi(const char *a)
{
	int r;

	r = 0;
	while (*a >= '0' && *a <= '9')
	{
		r = r * 10 + *a - '0';
		a++;
	}
	return (r);
}

void	encode(char c, int server_pid)
{
	int	i;

	i = 128;
	while (i > 0)
	{
		usleep(150);
		if (c < i)
		{
			if (kill(server_pid, SIGUSR1) == -1)
			{
				write(1, "wrong pid\n", 10);
				exit(1);
			}
		}
		else
		{
			if (kill(server_pid, SIGUSR2) == -1)
			{
				write(1, "wrong pid\n", 10);
				exit(1);
			}
			c -= i;
		}
		i = i >> 1;
	}
}

int	main(int argc, char **argv)
{
	int	server_pid;
	int	i;

	server_pid = ft_atoi(argv[1]);
	i = 0;
	if (argc != 3)
	{
		write(1, "expected arguments: ./client <server_pid> <message>\n", 52);
		exit(1);
	}
	while (argv[2][i] != 0)
	{
		encode(argv[2][i], server_pid);
		i++;
	}
	system("leaks client");
	return (0);
}
