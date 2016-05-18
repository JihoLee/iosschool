//
//  SecondViewController.m
//  Test0517
//
//  Created by LEEJIHO on 2016. 5. 17..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)loadView {
    [super loadView];
    NSLog(@"Second View Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Second View Controller viewDidLoad");

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    NSLog(@"Second View Controller viewWillAppear");
    
}

-(void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    NSLog(@"Second View Controller viewWillLayoutSubviews");
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"Second View Controller viewDidLayoutSubviews");
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"Second View Controller viewDidAppear");
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    NSLog(@"Second View Controller viewWillDisappear");
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"Second View Controller viewDidDisappear");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickCloseButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)dealloc {
    
    NSLog(@"Second View Controller dealloc");
    
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
