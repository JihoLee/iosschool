//
//  main.m
//  exam
//
//  Created by LEEJIHO on 2016. 5. 11..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger totalPoint(NSArray *list) {
    NSInteger total = 0;
    for (NSNumber *num in list) {
        total += num.integerValue;
    }
    
    return total;
}

CGFloat avgPoint(NSInteger total, NSInteger count) {
    
    CGFloat avg = 0;
    
    avg = (CGFloat)total / count;
    
    return avg;
}

void upgradeGooGooDan(NSArray *dan) {
    
    for (NSNumber *danNum in dan) {
        for (int i = 1; i < 10; i++) {
            printf("%zd * %zd = %zd\n", danNum.integerValue, i, danNum.integerValue * i);
        }
        
        printf("------------\n");
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *list = @[@100, @99, @80, @95];
        NSArray *danList = @[@3,@6,@9];
//        printf("%.3f\n", avgPoint(totalPoint(list), list.count));
        upgradeGooGooDan(danList);
        
    }
    return 0;
}
