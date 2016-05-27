//
//  MyClass.m
//  MathExample
//
//  Created by LEEJIHO on 2016. 5. 25..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass


- (void) primesCount {
    
    NSInteger limit = 100000;
    NSMutableArray *prime = [@[] mutableCopy];
    // Check가 true면 소수(지워지지 않음)이다, false면 소수가 아니다(지워짐)
    NSMutableArray *check = [NSMutableArray arrayWithCapacity:limit+1];
    
    
    for (NSInteger i = 0; i <= limit; i++) {
        [check addObject:@(YES)];
        //            [check addObject:[NSNumber numberWithBool:NO]];
        
    }
    
    
    NSLog(@"%zu", [check count]);
    
    for (NSInteger i = 2; i <= limit; i++) {
        if ([check[i] boolValue] == YES) {
            [prime addObject:@(i)];
            
            for (NSInteger j = i*i; j<=limit; j+=i) {
                check[j] = @(NO);
                
            }
        }
    }
    
    
    NSLog(@"%zu", [prime count]);
    
}


@end
