# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mseinic <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/02/14 11:35:32 by mseinic           #+#    #+#              #
#    Updated: 2017/02/17 18:19:10 by malaine          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#----------------MODIF--------------------#
NAME := 42sh

LINE_EDITION_PATH := line_edition/
LINE_EDITION := actions	print_cmd home_end go_up_and_down ft_ctrl	check_word check_space cut_cpy_paste\

FILES = main env_init line_init ft_term do_termcaps multi_line_init test_edit_line


#----------------MODIF--------------------#

#----------------STD--------------------#
COMPILER := gcc

SRC_PATH := src/

HDR_PATH := includes/

CACHE_PATH := cache/

INCF = -I $(HDR_PATH) -I libft/include/

CFLAGS = -g -Wextra -Wall $(INCF)

LIBFT = -L libft/ -lft -lncurses

LIB_PATH = libft/libft.a
#----------------STD--------------------#

#----------------ADDING PATH AND FORMAT TO THE FILENAMES--------------------#
FILES+=$(addprefix $(LINE_EDITION_PATH),$(LINE_EDITION))

SRC = $(addprefix $(SRC_PATH),$(addsuffix .c,$(FILES)))
OBJ = $(addprefix $(CACHE_PATH),$(addsuffix .o,$(FILES)))
#----------------ADDING PATH AND FORMAT TO THE FILENAMES--------------------#

#-----------------COLORS------------------#
#-------B = Bolt---------#
#-------I = Intense------#
#-------U = Underline----#
Green	:= "\033[0;32m"
Red		:= "\033[1;91m"
Yellow	:= "\033[0;33m"
CYAN	:= "\033[1;36m"
YELLOW	:= "\033[1;33m"
END 	:= "\033[0m"
#-----------------COLORS------------------#

CACHE:=.cache_exists

all: $(NAME)

$(NAME): $(OBJ) $(LIB_PATH)
		@echo $(Yellow) " Compiling --> $@ <-- with $(CFLAGS) " $(END)
		@$(COMPILER) $(OBJ) -o $@ $(INCF) $(LIBFT)
		@echo $(Green) " !!! Ready !!!" $(END)

$(CACHE_PATH)%.o:$(SRC_PATH)%.c | $(CACHE)
		@echo $(Green) "Creating $(NAME) : $@ with $< " $(END);
		@$(COMPILER) $(CFLAGS) -o $@ -c $<

%.c:
	@echo $(Red) "Missing file : $@" $(END)

$(CACHE):
	@mkdir -p $(CACHE_PATH)
	@mkdir -p $(CACHE_PATH)$(LINE_EDITION_PATH)

clean:
		@/bin/rm -rf $(CACHE_PATH)
		@/bin/rm -rf $(CACHE)
		@echo $(Red) "Deleting ---->>>> $(CACHE_PATH)" $(END)
fclean: clean
		@/bin/rm -rf $(NAME)
		@echo $(Red) "Deleting ---->>>> $(NAME)" $(END)
re: fclean all

norme:
		@echo $(Red)
		@norminette $(SRC) $(HDR_PATH) | grep -v Norme -B1 || true
		@echo $(END)

libft/libft.a:
		@echo $(CYAN) "Making $@" $(EOC)
		@make -C libft/
		@make -C libft clean
test:
		@echo $(YELLOW)"Files :\n\033[0;33m"$(HDR_PATH)
		@echo $(BLUE)"Objects :\n\033[0;34m"$(OBJ)
		@echo $(CYAN)"Sources :\n\033[0;36m"$(SRC)

.PHONY: all clean fclean re
