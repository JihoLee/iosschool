//
//  main.m
//  example
//
//  Created by LEEJIHO on 2016. 5. 5..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>


// 환율
const int exchangeRate = 1300;

int changeDollar(int money) {
    
    return money / exchangeRate;
}

// 원주율
const double PI = 3.14;

// 원 둘레
float circleGirth(float radius) {

    return 2 * PI * radius;
    
}

// 원 넓이
float circleArea(float radius) {

    return PI * radius * radius;
    
}


const float measures = 3.305;

// m^2 >> 평
float convertMeasure(float meter) {
    
    return meter / measures;
    
}

// 반올림
float makeRounding(float value) {
    
    float result = ((int)((value + 0.005) * 100.0) / 100.0);
    
    return result;
    
}

// 등급 구하기
int getRank(float avg) {
    
    int rank;
    
    if(avg >= 90) {
        
        rank = 1;
    }
    else if(avg >= 80) {
        
        rank = 2;
    }
    else if(avg >= 70) {
        
        rank = 3;
    }
    else if(avg >= 60) {
        
        rank = 4;
    }
    else {
        
        rank = 5;
    }
    
    return rank;
    
}

// 장학금 배분
void scholarshipWithGrade(int grade) {
    
    switch (grade) {
        case 1:
            printf("전액장학금\n");
            break;
        case 2:
            printf("장학금 50%%\n");
            break;
        case 3:
            printf("장학금 25%%\n");
            break;
        default:
            printf("없음\n");
            break;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         평수 구하기(제곱미터를 받아서 평으로 변환)
         */
        
        float meter = 84;
        float result = convertMeasure(meter);
        
        printf("%.1fm^2의 평수는 %.2f평이다.\n", meter,result);
        
        /*
         원의 둘레구하기
         */
        
        float radius = 3.5;
        float girthResult = circleGirth(radius);
        float areaResult = circleArea(radius);
        printf("반지름이 %.2f인 원의 둘레는 %.2f이고, 넓이는 %.2f이다.\n", radius, girthResult, areaResult);
        
        /*
         달러 환전계산기
         */
        
        int money = 14500;
        int changeResult = changeDollar(money);
        
        printf("%d원을 달러로 바꾸면 %d$이다.\n",money, changeResult);
        
        /*
         반올림 소수점 셋째자리까지 표시
         */
        
        printf("result : %f\n", makeRounding(2.261));
        
        
        /*
         평균으로 등급구하기
         */
        
        printf("rank : %d등급\n", getRank(88.14));
        
        /*
         위 등급으로 장학금 배분해주기
         */
        
        scholarshipWithGrade(getRank(88.14));
        
        
    }
    return 0;
}
