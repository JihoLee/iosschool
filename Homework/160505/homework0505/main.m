//
//  main.m
//  homework0505
//
//  Created by LEEJIHO on 2016. 5. 5..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

void game369(int value) {
    
    if(value > 29) {
        
        printf("30이하의 숫자를 입력하세요.\n");
        return;
    }
    
    
    for (int i = 1; i <= value; i++) {
        // if( i != 0 && i % 3 == 0)
        if(i % 10 == 3 || i % 10 == 6 || i % 10 == 9) {
            printf("*\n");
            
        }
        
        else {
            printf("%d\n", i);
        }
        
    }
}

void game369limit(int value) {
    bool result = false;
    for (int i = 1; i <= value; i++) {
        
        for (int j = i; j > 0; j=j/10) {
            
            // if( i != 0 && i % 3 == 0)
            if (j % 10 == 3 || j % 10 == 6 || j % 10 == 9) {
                result = true;
                break;
            }
            else {
                result = false;
            }
        }
        
        // '*' 출력
        if(result) {
            printf("*, ");
        }
        // 숫자 출력
        else {
            printf("%d, ", i);
        }
        
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        game369(29);
        game369limit(1000);
    }
    return 0;
}
