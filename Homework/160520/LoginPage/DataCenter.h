//
//  DataCenter.h
//  LoginPage
//
//  Created by LEEJIHO on 2016. 6. 5..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype) sharedInstance;

- (void)addUserIdAndPassword:(NSString *)userid password:(NSString *)password;
- (NSMutableDictionary *)userDictionary;

@end
