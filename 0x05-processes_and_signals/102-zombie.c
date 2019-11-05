#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
/**
 * infinite_while - infinite loop
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
/**
 *main - main function
 *Return: Nothing
 */
void main(void)
{
	int i = 0;
	pid_t child_pid;

	for (; i < 5; i++)
	{
		child_pid = fork();
		if (child_pid == 0)
		{
			dprintf(1, "Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
	}
	infinite_while();
}
