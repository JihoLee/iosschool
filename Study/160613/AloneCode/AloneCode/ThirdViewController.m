//
//  ThirdViewController.m
//  AloneCode
//
//  Created by Jyo on 2016. 6. 13..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "ViewController.h"

#define MARGIN 20
#define CUSTOM_HEIGHT 30
#define NAVI_HEIGHT 64

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *viewController = self.navigationController.viewControllers.firstObject;
    
    self.title = viewController.inputTextField.text;
    
    [self drawUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawUI {
    
    UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, NAVI_HEIGHT + MARGIN, MARGIN * 10, CUSTOM_HEIGHT)];
    
    [popButton setTitle:@"이전 화면으로" forState:UIControlStateNormal];
    [popButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [popButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [popButton addTarget:self action:@selector(moveBeforeView) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *popToRootButton = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, popButton.frame.origin.y + MARGIN * 2 , MARGIN * 10, CUSTOM_HEIGHT)];
    
    [popToRootButton setTitle:@"처음 화면으로" forState:UIControlStateNormal];
    [popToRootButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [popToRootButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [popToRootButton addTarget:self action:@selector(moveRootView) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:popButton];
    [self.view addSubview:popToRootButton];
}

- (void)moveBeforeView {
    
//    [self.navigationController popViewControllerAnimated:YES];
    
    Class destination = [ViewController class];
    
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if([vc isKindOfClass:destination]) {
            
            [self.navigationController popToViewController:vc animated:YES];
            
        }
    }
}

- (void)moveRootView {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
