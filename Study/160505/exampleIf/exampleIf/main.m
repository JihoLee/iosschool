//
//  main.m
//  exampleIf
//
//  Created by LEEJIHO on 2016. 5. 5..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
// int absoluteNum(int value) => int absoluteNumber(int value)
int absoluteNumber(int value) {
    
    if(value < 0) {
        
        value = -value;
    }
    
    return value;
    
}

void checkAlphabet(char value) {
    
    if(value >= 'a' && value <= 'z') {
        printf("소문자입니다.\n");
    }
    else if(value >= 'A' && value <= 'Z') {
        printf("대문자입니다.\n");
    }
    else if(value >= '0' && value <= '9') {
        printf("숫자입니다.\n");
    }
    else {
        printf("한글입니다.\n");
    }
    
    
}

bool checkLeapYear(int year) {
    
    bool result;

    if((year%4==0 && year%100!=0) || year%400==0) {
        result = true;
        
    }
    
    return result;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         절대값 구하기
         */
        
        printf("절대값은 %d입니다.\n", absoluteNumber(-5));
        
        /*
         문자 구분
         */
        
        checkAlphabet('8');
        
        /*
         윤년 구하기
         */
        
        if(checkLeapYear(2016) == 1) {
            printf("윤년입니다.\n");
        }
        else {
            printf("윤년이 아닙니다.\n");
        }
    }
    return 0;
}
