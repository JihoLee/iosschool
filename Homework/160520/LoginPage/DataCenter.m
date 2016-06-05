//
//  DataCenter.m
//  LoginPage
//
//  Created by LEEJIHO on 2016. 6. 5..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter



+ (instancetype) sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
        
    });
    
    return dataCenter;
    
}

// 회원가입 정보 저장
- (void)addUserIdAndPassword:(NSString *)userid password:(NSString *)password {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *basePath = [paths objectAtIndex:0];
    
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"friendList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 파일이 없다면 friendList.plist 파일을 Document로 복사
    if(![fileManager fileExistsAtPath:docuPath]) {
        
        NSString *bundelPath = [[NSBundle mainBundle] pathForResource:@"friendList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundelPath toPath:docuPath error:nil];
        
    }
    
    
    NSMutableDictionary *friendList = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    
    NSDictionary *newFriend = @{@"userid":userid, @"password":password};
    
    [friendList setObject:newFriend forKey:userid];
    
//    NSLog(@"list : %@", friendList);
    
    [friendList writeToFile:docuPath atomically:NO];
    
    

}

- (NSMutableDictionary *)userDictionary {
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *basePath = [paths objectAtIndex:0];
    
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"friendList.plist"];
    
    
    NSMutableDictionary *friendList = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    
    return friendList;
    
}


@end
