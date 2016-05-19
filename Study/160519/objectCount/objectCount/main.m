//
//  main.m
//  objectCount
//
//  Created by LEEJIHO on 2016. 5. 19..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

@interface TestClass : NSObject

@end

@implementation TestClass


int main(int argc, const char * argv[]) {
    MyClass *myInstance = [[MyClass alloc] init];
    
    [myInstance setName:@"jyo"];
    [myInstance setAge:28];
    
    NSLog(@"%@", [myInstance name]);
    NSLog(@"%zd", [myInstance age]);
    return 0;
}

@end
