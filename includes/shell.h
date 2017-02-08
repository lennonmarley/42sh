#ifndef SHELL_H
# define SHELL_H
# include <unistd.h>
# include "libft.h"
# include <stdbool.h>
# include <limits.h>
# define READ_BUFFER(X) (X->buffer)
# define READ_BUFFER_SIZE 6
# define STR_SIZE(X) (X->str.size)
# define STR(X) (char *)(X->str.data)

typedef	struct				s_env_cell
{
	char					*key;
	char					*value;
}							t_env_cell;

typedef struct				s_env
{
	t_tab					tab;
}							t_env;

typedef struct				s_line
{
	t_tab					str;
	char					buffer[READ_BUFFER_SIZE];
	size_t					count;
}							t_line;

typedef struct				s_env_info
{
	bool					flags[256];
}							t_env_info;

int							env_init(t_env *env, char **environ);

void						my_echo(t_env *env, char **cmd);
void						aux(t_env *env, char *buff, int *ex, int *ac);
int							check_set_name(t_env *env);
size_t						find_position(char **env, char *key);
void						print_env(t_env *env, char **cmd);
void						my_cd(t_env *env, char **cmd);
int							bin_execute(char **tab, char **env, char *bin_path);
void						print_tab(char **tab);
void						env_preparation(char *str, t_env *env);
void						get_env(t_env *env, char **environ);
int							execute(char **exec_tab, char **env_tab);
void						error(char *str);
void						del_tab(char **env);
size_t						ft_size(char **tab);
void						set_value(t_env *env, char *key, char *value);
void						unset_env_fnct(t_env *env, char *key);
void						init(t_env *env, char **environ);
int							ret_access(char *path, char **bin_path);
void						get_path(t_env *env);

extern t_env				g_env;
extern t_line				g_env;

#endif