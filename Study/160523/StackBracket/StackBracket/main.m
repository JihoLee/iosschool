//
//  main.m
//  StackBracket
//
//  Created by LEEJIHO on 2016. 5. 23..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string.h>
#include <stdio.h>

char str[50];
int n;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int t;
        scanf("%d", &t);
        
        for (int k = 0; k < t; k++) {
            scanf("%s", str);
            int n = strlen(str);
            
            int cnt = 0;
            int negative = 0;

            for (int i = 0; i < n; i++) {
            
                char c = str[i];
                
                if( c== '(') {
                    
                    cnt += 1;
                }
                
                else {
                    cnt -= 1;
                }
                
                if(cnt < 0 ) {
                    negative = 1;
                }
                
            }
            
            if(negative == 0 && cnt == 0) {
                printf("YES\n");
            }
            else {
                printf("NO\n");
            }
        }
        
    }
    return 0;
}
