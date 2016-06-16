//
//  DataCenter.h
//  AloneCode
//
//  Created by 민지 김 on 2016. 6. 15..
//  Copyright © 2016년 i_log. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;
- (NSInteger)sectionCount;
- (NSInteger)countForSection:(NSInteger)section;
- (NSArray *)listForSection:(NSInteger)section;
- (NSString *)titleForSection:(NSInteger)section;
- (NSInteger)heightForSection:(NSInteger)section;
- (NSArray *)imageForSection:(NSInteger)section;

@end
