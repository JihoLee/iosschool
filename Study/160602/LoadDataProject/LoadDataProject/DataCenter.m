//
//  DataCenter.m
//  LoadDataProject
//
//  Created by LEEJIHO on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    
    return dataCenter;
    
    
    
}

- (void)saveFriendName:(NSString *) name phoneNum:(NSString *) num {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *basePath = [paths objectAtIndex:0];
    
    NSString *docuPath = [basePath stringByAppendingString:@"friendList.plist"];
    
    NSLog(@"%@", docuPath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 파일이 없다면
    if(![fileManager fileExistsAtPath:docuPath]) {
        
        NSString *bundelPath = [[NSBundle mainBundle] pathForResource:@"friendList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundelPath toPath:docuPath error:nil];
        
    }
    
    
    NSMutableArray *friendList = [NSMutableArray arrayWithContentsOfFile:docuPath];
    
    NSDictionary *newFriend = @{@"name":name, @"phone":num};
    
    [friendList addObject:newFriend];
    
    [friendList writeToFile:docuPath atomically:NO];

    
}

- (NSArray *)friendList {
    
    /*
    // plist의 경로를 나타냄
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friendList" ofType:@"plist"];
    // plist에서 읽은 데이터를 array에 저장
    NSArray *friendList = [NSArray arrayWithContentsOfFile:path];
    */
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingString:@"friendList.plist"];
    
    
    NSArray *friendList = [NSArray arrayWithContentsOfFile:docuPath];

    return friendList;
    
}
@end
