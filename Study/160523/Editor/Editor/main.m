//
//  main.m
//  Editor
//
//  Created by LEEJIHO on 2016. 5. 23..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//
#include <stdio.h>
#include <string.h>

char stackL[500000];
char stackR[500000];
int left_size = 0;
int right_size = 0;
int main(int argc, const char * argv[]) {
    
    scanf("%s", stackL);
    
        
        int t;
        scanf("%d", &t);
        // count번 만큼 명령
        for (int i = 0; i < t; i++) {
            char cmd;
            scanf(" %c", &cmd);
            
            if(cmd == 'L') {
                
                if(left_size > 0) {
                
                    stackR[right_size] = stackL[left_size - 1];
                    right_size += 1;
//                    stackL[left_size - 1] = 0;
                    left_size -= 1;
                }
                
                
            }
            
            else if(cmd == 'D') {
                
                if(right_size > 0) {
                    stackL[left_size] = stackR[right_size - 1];
                    left_size += 1;
//                    stackR[right_size - 1] = 0;
                    right_size -= 1;
                }
                
            }
            
            else if(cmd == 'B') {
                
                if(left_size > 0) {
                    stackL[left_size - 1] = 0;
                    left_size -= 1;
                }
            }
            
            else if(cmd == 'P') {
                
                char x;
                scanf(" %c", &x);
                
                stackL[left_size] = x;
                
                left_size += 1;
                
                
            }
            
            
        }

        
        for (int j = 0; j < left_size; j++) {
            printf("%c", stackL[j]);
        }
    
        for (int k = right_size-1; k >= 0; k--) {
            printf("%c", stackR[k]);
        }
        
        printf("\n");
    
    return 0;
}
