//
//  DataCenter.m
//  AloneCode
//
//  Created by Jyo on 2016. 6. 14..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()
@property (nonatomic, strong) NSString *giveValue;

@end

@implementation DataCenter

+ (instancetype) sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
    });
    
    return dataCenter;
    
}

- (void)setGiveValue:(NSString *)value {
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"value"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)findValue {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"value"];
    
}

- (void)resetValue {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"value"];
    [[NSUserDefaults standardUserDefaults] synchronize];    
}

@end
