//
//  CustomTableViewCell.h
//  AloneCode
//
//  Created by 민지 김 on 2016. 6. 15..
//  Copyright © 2016년 i_log. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UIImageView *cellImageView;
@property(nonatomic, strong) IBOutlet UILabel *cellLabel;
@property(nonatomic, strong) IBOutlet UISwitch *cellSwitch;


@end
