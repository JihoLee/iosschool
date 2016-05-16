//
//  LastDate.m
//  exam
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "LastDate.h"

@implementation LastDate

// 년도와 Day를 입력받아 Day만큼 지난 일자를 반환하는 함수
- (NSInteger) questionYear:(NSInteger)year pastDay:(NSInteger)day {
    
    NSInteger month = 1; // 월
    NSInteger lastDay = 0; // 마지막 월 일수
    NSInteger date = 0; // 전체 날짜
    
    while (day > 0) {
        
        
//        NSLog(@"day : %zd", [self dayFromYear:year month:count]);
        day -= [self dayFromYear:year month:month];
        
        month++;
        
    }
    
    lastDay = [self dayFromYear:year month:month - 1];
    
    lastDay = lastDay + day;
    
    date = year * 10000 + (month - 1) * 100 + lastDay;
    
    return date;
    
    
    
}

// 년도와 월 입력으로 달의 일수를 반환하는 함수
- (NSInteger)dayFromYear:(NSInteger)year month:(NSInteger)month {
    NSInteger day = 0;
    
    
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            day = 31;
            break;
        case 4: case 6: case 9: case 11:
            day = 30;
            break;
        case 2:
            if([self getLeapYear:year]) {
                day = 29;
            }
            else {
                
                day = 28;
            }
            break;
        default:
            break;
    }
    return day;
    
}

// 윤년을 체크하는 함수
- (bool)getLeapYear:(NSInteger)year {
    bool isLeap = 0;
    
    if((year%4==0 && year%100!=0) || year%400==0) {
        isLeap = true;
        
    }

    return isLeap;
}

@end
