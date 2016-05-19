#include <stdio.h>
#include <string.h>
int main() {
    int arr[10000];
    int n;
    int size = 0;
    scanf("%d",&n);
    
    for (int k=0; k<n; k++) {
        char cmd[100];
        scanf("%s",cmd);
        
        if (!strcmp(cmd,"push")) {
            int num;
            scanf("%d",&num);
            
            arr[size] = num;
            
            size++;
            
            //push
        } else if (!strcmp(cmd,"top")) {
            // top
            if(size == 0) {
                printf("%d\n", -1);
            }
            else {
                printf("%d\n", arr[size-1]);
            }
            
        } else if (!strcmp(cmd,"size")) {
            // size
            
            printf("%d\n", size);
        } else if (!strcmp(cmd,"empty")) {
            // empty
            
            if(size == 0) {
                printf("%d\n", 1);
            }
            else {
                printf("%d\n", 0);
            }
            
        } else if (!strcmp(cmd,"pop")) {
            // pop
            if(size == 0) {
                printf("%d\n", -1);
            }
            else {
                printf("%d\n", arr[size-1]);
                size--;
            }
            
            
        }
    }
    return 0;
}
