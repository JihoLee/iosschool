//
//  CalculationScore.m
//  TestScore
//
//  Created by LEEJIHO on 2016. 5. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "CalculationScore.h"

@implementation CalculationScore
{
    
    NSMutableArray *subjects;
    
}

/*
 - 아래에 있는 init으로 초기화할 경우, 이 함수가 들어있는 클래스로 객체생성을 할 때 빈 
   어레이를 만들어 subjects에 넣겠다는 이야기입니다. 반면 위의 initWithSubjects으로 
   초기화하는 경우 객체 생성시 어레이를 인자를 받아 subjects에 넣겠다는 겁니다.
 
 - initWithSubject로 초기화하면 어레이를 객체 생성시 반드시 어레이를 넣어야 하는 상황인거죠..
 */
- (instancetype)initWithSubject:(NSArray *)newSubjects
{
    self = [super init];
    if (self) {
        subjects = [[NSMutableArray alloc]initWithArray:newSubjects];
    }
    return self;
}

// 과목 점수를 추가하는 함수
- (void) addSubjectScore:(NSInteger)score {
    
    // 객체가 생성되지 않았다면 객체 생성 및 초기화
    if(subjects == nil) {
        subjects = [[NSMutableArray alloc]initWithCapacity:1];
    }
    
    // 배열에 저장하려면 NSNumber로 변경해야 함 => 참조형 타입으로 변환
    NSNumber *scoreNum = [NSNumber numberWithInteger:score];
    
    [subjects addObject:scoreNum];
    
    
}

// 과목의 총점
- (NSInteger)totalScore {
    
    NSInteger sum = 0;
    
    for (NSNumber *subject in subjects) {
        sum += subject.integerValue;
    }
    
    return sum;
}

// 과목의 평균
- (CGFloat)averageScore {
    
    CGFloat avg = 0;
    
    // 과목이 1개 이상일 때
    if(subjects.count > 0) {
        avg = (CGFloat)[self totalScore] / subjects.count;
    }
    // 과목이 0개일 때
    else {
        avg = 0;
    }
    
    return avg;
}

- (NSString *)scoreToGrade:(NSInteger)score {
    
    NSString *grade = @"";
    
    if (score > 90) {
        grade = @"A+";
    }
    else if (score > 80 && score <= 90) {
        grade = @"A";
    }
    else if (score > 70 && score <= 80) {
        grade = @"B+";
    }
    else if (score > 60 && score <= 70) {
        grade = @"B";
    }
    else if (score > 50 && score <= 60) {
        grade = @"C+";
    }
    else if (score > 40 && score <= 50) {
        grade = @"C";
    }
    else {
        grade = @"F";
    }
    return grade;
}

- (CGFloat)gradeToPoint:(NSString *)grade {
    
    CGFloat point = 0;
    
    if ([grade isEqualToString:@"A+"]) {
        point = 4.5;
    }
    else if ([grade isEqualToString:@"A"]) {
        point = 4.0;
    }
    else if ([grade isEqualToString:@"B+"]) {
        point = 3.5;
    }
    else if ([grade isEqualToString:@"B"]) {
        point = 3.0;
    }
    else if ([grade isEqualToString:@"C+"]) {
        point = 2.5;
    }
    else if ([grade isEqualToString:@"C"]) {
        point = 2.0;
    }
    else {
        point = 0;
    }
    return point;
}

@end
