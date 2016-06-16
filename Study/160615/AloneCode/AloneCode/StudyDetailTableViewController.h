//
//  StudyDetailTableViewController.h
//  AloneCode
//
//  Created by 민지 김 on 2016. 6. 15..
//  Copyright © 2016년 i_log. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamTableViewController.h"

@interface StudyDetailTableViewController : UITableViewController
@property (nonatomic) NSString *tableTitle;
@property (nonatomic) NSArray *allData;

@property (nonatomic) DATA data;
@end
