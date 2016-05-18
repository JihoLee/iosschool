//
//  MyTestClass.m
//  Test0517
//
//  Created by LEEJIHO on 2016. 5. 17..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "MyTestClass.h"

@implementation MyTestClass

// override 재정의
+(instancetype)alloc {
    
    NSLog(@"My Test Class alloc");
    
    [self testClassMethod];
    // [self testInstanceMethod]; //호출불가
    
    return [super alloc];
}


- (void)dealloc
{
    NSLog(@"My Test Class dealloc");
    // 사용하고 있던 메모리 공간을 해제해줘야 할 때
    // 객체가 메모리에서 해제되는 시점을 파악하고자 할 때
    
    // [super dealloc];
    
    [self testInstanceMethod];
    // [self testclassMethod]; // 호출불가
    // 위 불가능했던 클래스 메소드를 호출할 때는 이와같이 사용
    [[self class] testClassMethod];
    [MyTestClass testClassMethod];
    
    
}

// 객체화가 이루어졌을때 사용가능
- (void)testInstanceMethod {
    
    NSLog(@"testInstanceMethod called");
    
}

// 클래스 자체로 사용가능
+ (void)testClassMethod {
    
    NSLog(@"testClassMethod called");
    
}

@end
