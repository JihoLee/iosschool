//
//  DataCenter.h
//  UITableViewCustomExam
//
//  Created by LEEJIHO on 2016. 6. 8..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherTableViewController.h"

typedef NS_ENUM(NSInteger, SettingRow) {
    
    SettingRowSound = 0,
    SettingRowVibrate
    
};

@interface DataCenter : NSObject

+ (instancetype) sharedInstance;

- (NSInteger) numberOfSectionsForSettingTable;
- (NSArray *) settingTableDataForSection:(NSInteger)section;
- (NSInteger) numberOfRowsForSettingTable:(NSInteger)section;
- (NSString *) settingTableHeaderTitleForSection:(NSInteger)section;

- (void)setSetting:(SettingRow) function isOn:(BOOL)isOn;
- (BOOL)isOnForSetting:(SettingRow) function;

-(NSArray *)dataForWeather:(WeatherType)type;
@end
