//
//  main.m
//  exampleFor
//
//  Created by LEEJIHO on 2016. 5. 6..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

// 1. 스왑함수 만들기
// void swapNum(int v1, int  v2) => void swapNumber(int v1, int  v2)
void swapNumber(int v1, int  v2) {
    
    int temp = 0;
    
    temp = v1;
    v1 = v2;
    v2 = temp;
    
    printf("result : %d, %d\n", v1, v2);
    
}

// 2. 삼각수 구하기
// int triangularNum(int value) => void int triangularNumber(int value)
int triangularNumber(int value) {
    int result = 0;
    
    for (int i = 1; i <= value; i++) {
        result += i;
    }
    printf("result : %d\n", result);
    return result;
    
    
}

// 3. 삼각수 구하기 - 두 수사이의 5의 배수 삼각수
void triangularsRangeNumber(int v1, int v2) {
    
    for (int i = v1; i <= v2; i++) {
        if(i % 5 == 0) {
            triangularNumber(i);
            
        }
        
    }
    
}

// 4. 각 자리수 더하는 함수
void addAllNumber(int value) {
    
    int result = 0;
    
    while (value >= 1) {
        
        result += (value % 10);
        value = value / 10;
        
 
    }
    
    
    printf("result : %d\n", result);
    
}

void printLine() {
    
    printf("--------------\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        swapNumber(10,25);
        printLine();
        triangularNumber(100);
        printLine();
        triangularsRangeNumber(6, 25);
        printLine();
        addAllNumber(12345);
        printLine();
        
    }
    return 0;
}
