//
//  SecondViewController.m
//  SingletonExam
//
//  Created by LEEJIHO on 2016. 6. 2..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "SecondViewController.h"
#import "DataCenter.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)okEvent:(UIButton *)sender {
    
    [[DataCenter sharedInstance] setAge:self.ageTextField.text.integerValue];
    [[DataCenter sharedInstance] printData];
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
