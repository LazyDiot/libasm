//ligne de test pour read
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

extern size_t ft_strlen(char *);
extern char * ft_strdup(const char *);
extern char *ft_strcpy(char *restrict, const char*restrict);
extern ssize_t ft_write(int, const void *, size_t);
extern ssize_t ft_read(int, void *, size_t);
extern int ft_strcmp(const char *, const char *);

int main()
{
    char *s = "NULL", *s1 = "NULLv", *s2 = "";
    char *vlong = "0123456789abcdefghijklmnopqrstuvwxyz";
    char my_b_read[25], lib_b_read[25];
    char cpy[64], cpy1[64];
    char *stdup1, *stdup2;
    int errno1 = 0, errno2 = 0;

    printf("strcmp's\nmine : %i\tlibc : %i\n", ft_strcmp(s, s1), strcmp(s, s1));
    printf("strcmp's\nmine : %i\tlibc : %i\n", ft_strcmp(s, s2), strcmp(s, s2));
    printf("strcmp's\nmine : %i\tlibc : %i\n", ft_strcmp(s2, s), strcmp(s2, s));
    printf("strcmp's\nmine : %i\tlibc : %i\n", ft_strcmp(vlong, s1), strcmp(vlong, s1));

    printf("\nstrlen's\nmine : %li\tlibc : %li\n", ft_strlen(s2), strlen(s2));
    printf("strlen's\nmine : %li\tlibc : %li\n", ft_strlen(s1), strlen(s1));
    printf("strlen's\nmine : %li\tlibc : %li\n", ft_strlen(vlong), strlen(vlong));

    printf("\nread's\n");
    int opfd = open("read.s", O_RDONLY);
    int i = ft_read(opfd, my_b_read, 25);
    close(opfd);
    opfd = open("read.s", O_RDONLY);
    int j = read(opfd, lib_b_read, 25);
    close(opfd);
    printf("mine : %.*s bytes read : %i \nlibc : %.*s bytes read : %i\n",i,  my_b_read, i, j, lib_b_read, j);

    printf("\ncpy's\nmine : %s\tlibc : %s\n", ft_strcpy(cpy, vlong), strcpy(cpy1, vlong));
    printf("cpy's\nmine : %s\tlibc : %s\n", ft_strcpy(cpy, s2), strcpy(cpy1, s2));

    printf("\nwrite's\n");
    printf("%li characters printed from mine\n", ft_write(1, "random message. could be accompanied with some vivaldi.\n", 56));
    printf("%li characters printed from libc\n", write(1, "random message. could be accompanied with some vivaldi.\n", 56));

    printf("\nlet's try to fuck some errno's\n");
    printf("my write failed because of invalid fd so this is its return value : %li\n", ft_write(-1, "huh", 3));
    errno1 = errno;
    printf("%d\n", errno1);
    printf("libc write failed because of invalid address %li\n", write(1, NULL, 4));
    errno2 = errno;
    printf("%d\n", errno2);
    printf("libc write failed because of invalid fd so this is its return value : %li\n", write(-1, "huh", 3));
    errno1 = errno;
    printf("%d\n", errno1);
    printf("my write failed because of invalid address %li\n", ft_write(1, NULL, 4));
    errno2 = errno;
    printf("%d\n", errno2);
    
    printf("\nstrdup's\n");
    printf("mine :%s\tlibc : %s\n", stdup1 = ft_strdup(vlong), stdup2 = strdup(vlong));
    free(stdup1);
    free(stdup2);
}