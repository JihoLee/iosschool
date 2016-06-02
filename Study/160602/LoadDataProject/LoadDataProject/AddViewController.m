//
//  AddViewController.m
//  LoadDataProject
//
//  Created by LEEJIHO on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "AddViewController.h"
#import "DataCenter.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAction:(UIButton *)sender {
    
    NSString *name = [self.nameTextfield text];
    NSString *phone = [self.phoneTextField text];
    
    [[DataCenter sharedInstance] saveFriendName:name phoneNum:phone];
    [self.navigationController popViewControllerAnimated:YES];
    
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
