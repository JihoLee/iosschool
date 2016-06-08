//
//  DataCenter.m
//  UITableViewCustomExam
//
//  Created by LEEJIHO on 2016. 6. 8..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "DataCenter.h"
/*
 사용자가 사운드나 진동을 켰는지 껏는지를 저장하기 위한 키
 */
static NSString *const keySoundSetting = @"UserSoundIsOn";
static NSString *const keyVibrateSetting = @"UserVibrateIsOn";

@interface DataCenter()

// 각 row 데이터
@property (nonatomic, strong) NSArray *settingTableData;
@property (nonatomic, strong) NSArray *weatherData;

// TableView Header Title
@property (nonatomic, strong) NSArray *settingHeaderTitle;

@end

@implementation DataCenter

+ (instancetype) sharedInstance {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.settingTableData = @[@[@"사운드", @"진동"], @[@"세계날씨", @"한국날씨"]];
        dataCenter.settingHeaderTitle = @[@"설정", @"날씨"];
    });
    
    return dataCenter;
    
}

- (NSInteger) numberOfSectionsForSettingTable {
    
    return 2;
    
}

- (NSInteger) numberOfRowsForSettingTable:(NSInteger)section {
    
    return [[self settingTableDataForSection:section] count];
    
}

- (NSArray *) settingTableDataForSection:(NSInteger)section {
    
    return (NSArray *)self.settingTableData[section];
}



- (NSString *)settingTableHeaderTitleForSection:(NSInteger)section {
    
    
    return (NSString *)self.settingHeaderTitle[section];
}

- (void)setSetting:(SettingRow) function isOn:(BOOL)isOn {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    if(function == SettingRowSound) {
        key = keySoundSetting;
    }
    else {
        key = keyVibrateSetting;
    }
    
    [userDefaults setBool:isOn forKey:key];
    
    NSLog(@"%d", [userDefaults boolForKey:key]);
    
    [userDefaults synchronize];
    
    
}

- (BOOL)isOnForSetting:(SettingRow) function {
    
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    if(function == SettingRowSound) {
        key = keySoundSetting;
    }
    else {
        key = keyVibrateSetting;
    }
    
    BOOL result = [userdefaults boolForKey:key];
    
    return result;
    
}

- (NSString *)loadKey:(SettingRow) function {
    
    NSString *key = nil;

    return key;
    
}

-(NSArray *)dataForWeather:(WeatherType)type {
    
    if(type == WeatherTypeKorea) {
        return @[@"서울", @"대전", @"대구", @"부산"];
    }
    else {
        return @[@"서울", @"도쿄", @"뉴욕", @"베를린", @"싱가폴", @"알마티"];
    }
    
}

@end
