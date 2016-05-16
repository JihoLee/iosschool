//
//  main.m
//  dday
//
//  Created by LEEJIHO on 2016. 5. 9..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

const int ANNIVERSAYDATE = 20170510; // 기념일
const int TODAYDATE = 20160510; // 오늘

bool datePlusMinus = 0; // 이전 날짜와 이후 날짜를 구분
int afterDate = 0; // 이후 날짜
int beforeDate = 0; // 이전 날짜

// 윤년 체크
bool isLeapYear(int year) {
    bool isLeap;
    
    if((year%4==0 && year%100!=0) || year%400==0) {
        isLeap = true;
        
    }

    return isLeap;
}

// 해당 월의 마지막 일 반환
int lastDayOfMonth(int month, int year) {
    int lastDay;
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            lastDay = 31;
            break;
        case 4: case 6: case 9: case 11:
            lastDay = 30;
            break;
        case 2:
            // 윤년
            if(isLeapYear(year) == 1) {
                lastDay = 29;
            }
            else {
                lastDay = 28;
            }
            break;
        default:
            break;
    }
    return lastDay;
    
}

// 날짜형식에서 연 반환
int getYear(int date) {
    
    return date / 10000;
    
}

// 날짜형식에서 월 반환
int getMonth(int date) {
    
    return (date % 10000) / 100;
    
}

// 날짜형식에서 일 반환
int getDay(int date) {
    
    return (date % 10000) % 100;
    
}

// 기준일부터 해당 날짜까지 전체 일 계산
int totalDayWithDate(int date) {
    
    int total = 0;
    int month = getMonth(date);
    
    for (int count = 1; count < month; count++) {
        total += lastDayOfMonth(count, getYear(date));
    }
    
    total += getDay(date);
    return total;
    
}



// 전체 DDay 계산
void calculationDday(int today) {
    
    // 기념일이 이미 지남.
    if(today > ANNIVERSAYDATE) {
        afterDate = today;
        beforeDate = ANNIVERSAYDATE;
        datePlusMinus = 0;
        
    }
    // 기념일이 아직 안지남.
    else {
        afterDate = ANNIVERSAYDATE;
        beforeDate = today;
        datePlusMinus = 1;
    }
    
    
    int diffYear = getYear(afterDate) - getYear(beforeDate);
    
    
    int ddayResult = 0;
    int yearAllDay = diffYear * 365;
    
    /*
     beforeDate와 afterDate 사이의 윤년을 체크하여 일 수 증가
     */
    int leapDay = 0; // 증가할 일 수
    int year = getYear(beforeDate);
    
    for (int count = 0; count < diffYear - 1; count++) {
        year = year + 1;
        
        if(isLeapYear(year)) {
            leapDay += 1;
        }
    }
    ddayResult = yearAllDay - totalDayWithDate(beforeDate) + totalDayWithDate(afterDate) + leapDay;

    if(ddayResult == 0) {
        printf("오늘입니다.\n");
    }
    else {
        if(datePlusMinus) {
            printf("%d일 남았습니다.\n", ddayResult);
        }
        else {
            printf("%d일 지났습니다.\n", ddayResult);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        calculationDday(TODAYDATE);
    
    }
    return 0;
}
