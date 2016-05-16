//
//  Reverse.m
//  exam
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "Reverse.h"

@implementation Reverse

- (NSInteger)rev:(NSInteger) num {
    
    NSInteger length = 0;           // 길이 체크
    NSInteger result = 0;           // 리버스 결과 값
    NSInteger lengthCheckNum = num; // 길이 체크를 하기 위해 기존 데이터 대입
    NSInteger calculateNum = num;   // 계산 결과를 위해 기존 데이터 대입
    
    // 숫자길이체크
    // 데이터가 정수일 경우에만 while문 진행
    while (lengthCheckNum > 0) {
        
        /*
         입력된 숫자를 나눠가면서 길이를 체크
         
         ex) 1234
         
         inputNum = 123    length = 1
         inputNum = 12     length = 2
         inputNum = 1      length = 3
         inputNum = 0.1(0) length = 4 >> inputNum이 0이면 while문 종료
         
         길이가 4라는 것을 확인할 수 있음.
         */
        lengthCheckNum /= 10;
        
        length++;
    }
    
    // 계산결과
    // 입력된 숫자의 길이가 정수일 경우에만 while문 진행
    while (length > 0) {
        
        // 입력된 숫자에서 나머지 10을 구하고 길이-1만큼 10을 제곱한 값을 곱하여 결과 값에 대입
        // 12345의 경우
        result += (calculateNum % 10) * [self getSquareValue:length - 1];
        
        // 값을 10으로 나눠서 값 길이를 줄임
        calculateNum = calculateNum / 10;
        
        // 길이 - 1
        length--;
    }
    
    return result;
    
}

// 제곱 함수
- (NSInteger) getSquareValue:(NSInteger) len {
    NSInteger result = 1;
    for (int i = 0; i < len; i++) {
        result *= 10;
    }
    
    return result;
}

@end
