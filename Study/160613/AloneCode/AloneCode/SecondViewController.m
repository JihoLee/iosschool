//
//  SecondViewController.m
//  AloneCode
//
//  Created by Jyo on 2016. 6. 13..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "ThirdViewController.h"

#define MARGIN 20
#define CUSTOM_HEIGHT 30
#define NAVI_HEIGHT 64

@interface SecondViewController ()

@property (nonatomic, strong) UILabel *firstViewValueLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 네비게이션 컨트롤러에 속해있는 뷰를 배열에 담아서 각각 접근이 가능함
    ViewController *viewController = self.navigationController.viewControllers.firstObject;

    [self drawUI];
    
    [self.firstViewValueLabel setText:viewController.inputTextField.text];
    [self.firstViewValueLabel setTextColor:[UIColor blackColor]];
    // Do any additional setup after loading the view.
}

- (void)drawUI {
    
    UILabel *firstViewValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, MARGIN + NAVI_HEIGHT, self.view.frame.size.width - MARGIN * 2, CUSTOM_HEIGHT)];
    
    UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, firstViewValueLabel.frame.origin.y + MARGIN * 2 , MARGIN * 10, CUSTOM_HEIGHT)];
    
    [popButton setTitle:@"다음 화면으로" forState:UIControlStateNormal];
    [popButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [popButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [popButton addTarget:self action:@selector(nextMoveView) forControlEvents:UIControlEventTouchUpInside];
    
    self.firstViewValueLabel = firstViewValueLabel;
    
    [self.view addSubview:firstViewValueLabel];
    [self.view addSubview:popButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextMoveView {
    
    ThirdViewController *thirdViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdView"];
    
    [self.navigationController pushViewController:thirdViewController animated:YES];
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
