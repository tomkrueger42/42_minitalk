/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tkruger <tkruger@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/29 00:11:34 by tomkrueger        #+#    #+#             */
/*   Updated: 2022/01/06 00:37:11 by tkruger          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minitalk.h"

int		pos = 0;
char	c;

void sigusr1_handler()
{
	pos++;
}

void sigusr2_handler()
{
	int	value;
	int	count;

	value = 128;
	count = 0;
	while (count++ < pos)
	{
		value = value >> 1;
	}
	c += value;
	pos++;
}

int	main(void)
{
	printf("%i\n", getpid());
	while (1)
	{
		if (pos == 8)
		{
			write(1, &c, 1);
			c = 0;
			pos = 0;
		}
		signal(SIGUSR1, sigusr1_handler);
		if (pos == 8)
		{
			write(1, &c, 1);
			c = 0;
			pos = 0;
		}
		signal(SIGUSR2, sigusr2_handler);
	}
	return (0);
}
