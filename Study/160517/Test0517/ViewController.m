//
//  ViewController.m
//  Test0517
//
//  Created by LEEJIHO on 2016. 5. 17..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"
#import "MyTestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    NSLog(@"View Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    MyTestClass *testObject = [[MyTestClass alloc] init];

    // viewDidLoad 메소드가 끝나는 시점에서 testObject가 메모리에서 해제됨
    
    NSLog(@"Break!");
    
    NSLog(@"viewDidLoad will finish");
    
    // Do any additional setup after loading the view, typically from a nib.
     
    */
     NSLog(@"View Controller viewDidLoad");
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    NSLog(@"View Controller viewWillAppear");
    
}

-(void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    NSLog(@"View Controller viewWillLayoutSubviews");
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"View Controller viewDidLayoutSubviews");
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"View Controller viewDidAppear");
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    NSLog(@"View Controller viewWillDisappear");
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"View Controller viewDidDisappear");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
