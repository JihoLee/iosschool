//
//  SettingTableViewCell.h
//  UITableViewCustomExam
//
//  Created by LEEJIHO on 2016. 6. 8..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingTableViewCell;

// 어떤 Switch가 눌렸는지를 파악하기 위해서 프로토콜을 만듬 - 스위치의 값이 변경될 때 호출할 메소드
@protocol SettingTableViewCellDelegate <NSObject>

- (void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, strong) UISwitch *settingSwitch;
// SettingTableViewCellDelegate 프로토콜을 따른다.
@property (nonatomic, weak) id<SettingTableViewCellDelegate> delegate;

@end