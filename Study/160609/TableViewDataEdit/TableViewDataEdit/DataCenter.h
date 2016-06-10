//
//  DataCenter.h
//  TableViewDataEdit
//
//  Created by LEEJIHO on 2016. 6. 9..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface DataCenter : NSObject

+ (instancetype) sharedInstance;

- (NSMutableArray *)dataForSection:(NSInteger)section;
- (void)insertNewItemInSecondSection;
- (void)removeFirstSectionItemAtIndex:(NSInteger)index;
@end
