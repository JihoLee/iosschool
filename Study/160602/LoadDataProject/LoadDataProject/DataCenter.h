//
//  DataCenter.h
//  LoadDataProject
//
//  Created by LEEJIHO on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)friendList;
- (void)saveFriendName:(NSString *) name phoneNum:(NSString *) num;
@end
