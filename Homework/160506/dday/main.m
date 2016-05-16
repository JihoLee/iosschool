//
//  main.m
//  dday
//
//  Created by LEEJIHO on 2016. 5. 6..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

int anniversary = 0;
const int ANNIDATE = 20180507;
const int TODAYDATE = 20160507;

void setDate(int date) {
    
    anniversary = date;
    
}

int getYear(int date) {
    
    return date / 10000;
}

int getMonth(int date) {
    
    return (date % 10000) / 100;
}

int getDayInDate(int date) {
    
    return (date % 10000) % 100;
}

int getYearMonth(int date) {
    
    
    return date % 100;
}

// 윤년 구하기
bool checkLeapYear(int year) {
    
    bool result;
    
    if((year%4==0 && year%100!=0) || year%400==0) {
        result = true;
        
    }
    
    return result;
}

void printDDay(int dday) {
    
    printf("%d일 남았습니다.\n", dday);
}

// 월별 일수 구하기
int getDay(int month) {
    int day;
    switch (month) {
        case 1:case 3:case 5:
        case 7:case 8:case 10:
        case 12:
            day = 31;
            break;
        case 2:
            if (checkLeapYear(getYear(anniversary))) {
                day = 29;
            }
            else {
                day = 28;
            }
            break;
        case 4:case 6:
        case 9:case 11:
            day = 30;
            break;
        default:
            break;
    }
    
    return day;
    
    
}


void checkDDay(int today) {
    // 동일 년도
    if(getYear(anniversary) == getYear(today)) {
        
        int daySum = 0;

        // 오늘과 기념일 사이의 개월 수
        int todayInMonth = getMonth(today); // 오늘날짜 일 수
        int anniversaryInMonth = getMonth(ANNIDATE); // 기념일 일 수
        
        // 달 차이 = 1
        int monthSub = anniversaryInMonth - todayInMonth;
        
        // 오늘, 기념일 달을 제외한 나머지 달 일 계산
        for (int i = 1; i < monthSub; i++) {
            int sub = anniversaryInMonth - i;
            daySum += getDay(sub);
        }
        
        // 오늘 달의 일 수
        int todayDay = getDay(getMonth(today)) - (today % 100);
        
        // 기념일 월에 대한 일 수
        int anniDay = ANNIDATE % 100;
        int result = 0;
        
        result = anniDay + daySum + todayDay;
    
        printDDay(result);
        
    }
    // 년도가 틀릴 때
    else {
        
        // 년도차이
        int yearSub = (getYear(ANNIDATE) - getYear(today)) * 12;
        int allMonth = yearSub - getMonth(today) + getMonth(ANNIDATE) - 1;
        int ddayResult = 0;
        
        int year = getYear(ANNIDATE);
        int month = getMonth(ANNIDATE) - 1;
        int count = 0;
        while (count<allMonth) {
            // allMonth만큼 돈다
            ddayResult += getDay(month);
            
            month = month - 1;
            
            if (month == 2) {
                if(checkLeapYear(year)) {
                    ddayResult += 1;
                }
            }
            
            if(month < 1) {
                month = 12;
                year = year - 1;
            }
            
            count++;
            
        }
        
        // 기념일 월의 일수
        ddayResult += getDayInDate(anniversary);
        
        // 오늘 월의 일수
        ddayResult += getDay(getMonth(today)) - getDayInDate(today);
        
        printDDay(ddayResult);
    
        
    }

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Hiring day
        setDate(ANNIDATE);
        
        // 오늘 날짜 입력하고 d-day 구하기
        checkDDay(TODAYDATE);
       
        
        
    }
    return 0;
}
