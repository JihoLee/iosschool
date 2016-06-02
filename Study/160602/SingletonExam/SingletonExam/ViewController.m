//
//  ViewController.m
//  SingletonExam
//
//  Created by LEEJIHO on 2016. 6. 2..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    
    [[DataCenter sharedInstance] printData];
    
    
}

- (IBAction)okEvent:(UIButton *)sender {
    
    [[DataCenter sharedInstance] setName:self.nameTextField.text];
    [[DataCenter sharedInstance] printData];
}

@end
