//
//  DataCenter.m
//  TableViewDataEdit
//
//  Created by LEEJIHO on 2016. 6. 9..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property(nonatomic, strong) NSMutableArray *firstSectionData;
@property(nonatomic, strong) NSMutableArray *secondSectionData;

@end

@implementation DataCenter


+ (instancetype) sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.firstSectionData = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", nil];
        dataCenter.secondSectionData = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", @"D",@"E",@"F",nil];
    });
    
    return dataCenter;
    
}

- (NSMutableArray *)dataForSection:(NSInteger)section {
    
    if(section == 0) {
        return self.firstSectionData;
    }
    
    return self.secondSectionData;
    
}

// 2번째 Section에 'New Item' 데이터 추가
- (void)insertNewItemInSecondSection {
    
    [self.secondSectionData addObject:@"New Item"];
    
}

// 1번째 Section에서 row에 해당하는 데이터 삭제
- (void)removeFirstSectionItemAtIndex:(NSInteger)index {
    
    [self.firstSectionData removeObjectAtIndex:index];
}

@end
