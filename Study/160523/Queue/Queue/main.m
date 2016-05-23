//
//  main.m
//  Queue
//
//  Created by LEEJIHO on 2016. 5. 23..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//
#include <stdio.h>
#include <string.h>
int k = 0;
int queue[10000];

int begin = 0;
int end = 0;
int main(int argc, const char * argv[]) {

    scanf("%d", &k);
    
    
    
    for (int i = 0; i < k; i++) {
        
        
        char code[100];
        scanf("%s", code);
        
        if(!strcmp(code, "pop")) {
            
            if(begin == end) {
                printf("-1\n");
                
            }
            else {
                
                printf("%d\n", queue[begin]);
                begin += 1;
            }
            
        }
        
        else if(!strcmp(code, "size")) {
            
            printf("%d\n", end-begin);
            
            
        }
        
        else if(!strcmp(code, "empty")) {
            
            if (begin == end) {
                printf("1\n");
            }
            else {
                printf("0\n");
            }
            
        }
        
        else if(!strcmp(code, "front")) {
            
            if(begin == end) {
                printf("-1\n");
                
            }
            else {
                printf("%d\n", queue[begin]);
            }
            
            
        }
    
        
        else if(!strcmp(code, "back")) {
            
            if(begin == end) {
                printf("-1\n");

            }
            else {
                printf("%d\n", queue[end-1]);
            }
        }
        
        else {
            int num;
            scanf("%d", &num);
            queue[end] = num;
            end += 1;
        }
        
    }
    
    
    printf("\n");
    
    return 0;
}
