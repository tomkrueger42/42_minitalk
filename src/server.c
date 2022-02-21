/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tkruger <tkruger@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/06 01:05:38 by tkruger           #+#    #+#             */
/*   Updated: 2022/02/21 13:20:03 by tkruger          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minitalk.h"

struct s_received	g_received;

void	sigusr1_handler(__unused int a)
{
	g_received.pos++;
}

void	sigusr2_handler(__unused int a)
{
	int	value;
	int	count;

	value = 128;
	count = 0;
	while (count++ < g_received.pos)
	{
		value = value >> 1;
	}
	g_received.c += value;
	g_received.pos++;
}

int	main(void)
{
	ft_printf("%i\n", getpid());
	while (1)
	{
		if (g_received.pos == 8)
		{
			write(1, &g_received.c, 1);
			g_received.c = 0;
			g_received.pos = 0;
		}
		signal(SIGUSR1, sigusr1_handler);
		if (g_received.pos == 8)
		{
			write(1, &g_received.c, 1);
			g_received.c = 0;
			g_received.pos = 0;
		}
		signal(SIGUSR2, sigusr2_handler);
	}
	return (0);
}
