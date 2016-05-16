//
//  main.m
//  exam
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reverse.h"
#import "LastDate.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 숫자 리버스
        Reverse *r = [[Reverse alloc]init];
        NSLog(@"reverse : %zd", [r rev:12345]);
        
        
        // 날짜 구하기
        LastDate *l = [[LastDate alloc]init];
        NSLog(@"date : %zd", [l questionYear:2016 pastDay:100]);
        
    }
    return 0;
}
