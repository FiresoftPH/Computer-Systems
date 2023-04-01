# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <fcntl.h>
# include <sys/shm.h>
# include <sys/stat.h>
# include <sys/mman.h>

int chosen;
char temp[20];
int sum;

int ask(){
    printf("Choose a number");
    scanf("%d", &chosen);

    int i;
    for (i = 0; i <= chosen; i ++){
        sum += i;
    }

    sprintf(temp, "%d", sum);

    return 0;

}

int main(){
    const int SIZE = 8192;
    const char *name = "OS";
    
    const char *message_0 = temp;
    const char *message_1 = " is the answer";
    int shm_fd;
    void *ptr;

    ask();

    shm_fd = shm_open(name, O_CREAT | O_RDWR, 0666);
    ftruncate(shm_fd, SIZE);
    ptr = mmap(0, SIZE, PROT_WRITE, MAP_SHARED, shm_fd, 0);

    sprintf(ptr, "%s", message_0);
    ptr += strlen(message_0);
    sprintf(ptr, "%s", message_1);
    ptr += strlen(message_1);

    return 0;
}