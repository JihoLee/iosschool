//
//  ViewController.m
//  UINavigationExam
//
//  Created by LEEJIHO on 2016. 5. 31..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}


- (IBAction)nextButton:(id)sender {
    
    
    ThirdViewController *third = [[ThirdViewController alloc] init];
    
    [self.navigationController pushViewController:third animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
