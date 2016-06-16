//
//  DataCenter.h
//  AloneCode
//
//  Created by Jyo on 2016. 6. 14..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype) sharedInstance;

- (NSString *)findValue;
- (void)setGiveValue:(NSString *)value;
- (void)resetValue;

@end
