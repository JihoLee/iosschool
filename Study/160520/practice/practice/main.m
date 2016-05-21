//
//  main.m
//  practice
//
//  Created by LEEJIHO on 2016. 5. 20..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyClass *mc = [[MyClass alloc] init];
        
        [mc setAa:3];
        NSLog(@"a : %zd", [mc aa]);
    }
    return 0;
}
