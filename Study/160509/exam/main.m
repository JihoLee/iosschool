//
//  main.m
//  exam
//
//  Created by LEEJIHO on 2016. 5. 9..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>


// 총점
NSInteger totalSubjects(NSArray *subjects) {
    NSInteger total = 0;
    for (NSNumber *score in subjects) {
        total += score.integerValue;
    }
    
    return total;
}

// 평균
CGFloat avgScore(NSArray *subjects) {

    CGFloat avg = 0.0;
    
    avg = (CGFloat)(totalSubjects(subjects)) / subjects.count;
    
    return avg;
}

// 구구단
void upgradeGooGooDan(NSArray *googoodan) {
    
    for (NSNumber *dan in googoodan) {
        for (int i = 1; i <= 9; i++) {
            NSInteger result = dan.integerValue * i;
            NSLog(@"%zd * %d = %zd", dan.integerValue, i, result);
            
        }
        
        NSLog(@"----------");
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *subjectList = @[@100, @99, @90, @74, @92, @56];
        NSArray *subject = [[NSArray alloc]initWithObjects:@100, @99, @90, @74, @92, @56, nil];
//        NSArray *googoodan = @[@1, @3, @5];
        
//        NSLog(@"총점은 : %zd, 평균은 : %.2f이다.", totalSubjects(subjectList), avgScore(subjectList));
//        upgradeGooGooDan(googoodan);
        NSLog(@"%zd", -1);
        
    }
    return 0;
}
