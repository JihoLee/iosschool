//
//  SettingTableViewCell.m
//  UITableViewCustomExam
//
//  Created by LEEJIHO on 2016. 6. 8..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

// 셀 안에 있는 Switch의 값이 변할 때 호출되는 메소드
- (void)switchValueChanged:(UISwitch *)sender {
    
    [self.delegate settingTableViewCellSwitchValueChanged:self isOn:sender.isOn];
    
}


// 뷰가 처음 그려질 때 호출
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    // Switch가 생성되지 않았다면 생성
    if(self.settingSwitch == nil) {
        self.settingSwitch = [[UISwitch alloc] init];
        self.accessoryView = self.settingSwitch;
        [self.settingSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
