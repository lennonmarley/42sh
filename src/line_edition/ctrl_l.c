/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ctrl_l.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: malaine <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/20 18:59:21 by malaine           #+#    #+#             */
/*   Updated: 2017/02/20 19:07:18 by malaine          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "edit_line.h"

void	ft_ctrl_l(t_line *l)
{
	do_term("cl");
	l->sauv_cursor = l->cursor;
	l->cursor = 0;
	ft_putstr("$> ");
	print(l);
}
