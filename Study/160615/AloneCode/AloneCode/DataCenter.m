//
//  DataCenter.m
//  AloneCode
//
//  Created by 민지 김 on 2016. 6. 15..
//  Copyright © 2016년 i_log. All rights reserved.
//

#import "DataCenter.h"
@interface DataCenter()

@property (nonatomic, strong) NSMutableArray *sectionData;
@property (nonatomic, strong) NSMutableArray *sectionTitle;
@property (nonatomic, strong) NSMutableArray *sectionHeightData;
@property (nonatomic, strong) NSMutableArray *rowImageData;

@end

@implementation DataCenter

+ (instancetype) sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        
        // section data가 총 몇개인지 파악하기 위한 배열
        dataCenter.sectionData = [[NSMutableArray alloc] initWithObjects:@[@"School", @"Camp"], @[@"한국날씨", @"세계날씨"], nil];
        dataCenter.rowImageData = [[NSMutableArray alloc] initWithObjects:@[@"row1", @"row2"], @[@"row3", @"row4"], nil];
        dataCenter.sectionHeightData = [[NSMutableArray alloc] initWithObjects:@"45", @"100", nil];
        dataCenter.sectionTitle = [[NSMutableArray alloc] initWithObjects:@"패스트캠퍼스 강좌", @"날씨", nil];
        
    });
    
    return dataCenter;
    
}

- (NSArray *) imageForSection:(NSInteger)section {
    
    return [self.rowImageData objectAtIndex:section];
}
- (NSString *) titleForSection:(NSInteger)section {
    
    
    return [self.sectionTitle objectAtIndex:section];
}

- (NSInteger) sectionCount {
    
    return [self.sectionData count];
}

- (NSInteger) countForSection:(NSInteger)section {
    
    return [[self listForSection:section] count];
    
}

- (NSArray *) listForSection:(NSInteger)section {
    
    return [self.sectionData objectAtIndex:section];
    
}

- (NSInteger) heightForSection:(NSInteger)section {
    
    return [[self.sectionHeightData objectAtIndex:section] integerValue];
}


@end
