/*
  MoinMoin setuid wrapper by perky
  $FreeBSD$
*/
#include <unistd.h>

int
main(int argc, char *argv[], char *envp[])
{
	char *margv[] = { PYTHON_PATH, SCRIPT_PATH, NULL };

	return exect(PYTHON_PATH, margv, envp);
}
