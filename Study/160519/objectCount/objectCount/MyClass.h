//
//  MyClass.h
//  objectCount
//
//  Created by LEEJIHO on 2016. 5. 19..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject {
    NSInteger _age;
}

- (NSInteger)age;
- (void)setAge:(NSInteger)age;

@property (strong, nonatomic) NSString *name;

@end
