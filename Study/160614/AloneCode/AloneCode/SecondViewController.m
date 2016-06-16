//
//  SecondViewController.m
//  AloneCode
//
//  Created by Jyo on 2016. 6. 14..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "DataCenter.h"

@interface SecondViewController ()

@property (nonatomic, strong) IBOutlet UILabel *secondLabel;
@property (nonatomic, strong) IBOutlet UIButton *moveButton;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    if(self.moveValue == 1) {
    
        self.moveButton.hidden = NO;
        
    }
    else {
        self.moveButton.hidden = YES;
    }
    
//    FirstViewController *firstView = self.tabBarController.viewControllers.firstObject;
    
    // 데이터센터에서 데이터를 로드
    [self.secondLabel setText:[[DataCenter sharedInstance] findValue]];
    
    // 데이터센터 데이터 초기화
    [[DataCenter sharedInstance] resetValue];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    
    // 데이터센터 데이터 초기화
    [[DataCenter sharedInstance] resetValue];
    
}

- (IBAction)dismissSecondView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
