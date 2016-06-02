//
//  DataCenter.h
//  SingletonExam
//
//  Created by LEEJIHO on 2016. 6. 2..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;


- (void)printData;
// 싱글톤 변수의 클래스 메소드
+ (instancetype) sharedInstance;

@end
