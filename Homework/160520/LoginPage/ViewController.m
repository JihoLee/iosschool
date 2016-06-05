//
//  ViewController.m
//  LoginPage
//
//  Created by LEEJIHO on 2016. 5. 20..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewController.h"
#import "DataCenter.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIView *loginView;

@property (nonatomic, weak) IBOutlet UITextField *userIdTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@property (nonatomic, weak) NSUserDefaults *defaults;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.defaults = defaults;
    
    __weak ViewController *wview = self;
    
    [self.navigationController setTitle:@"My Login Page"];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.loginView setFrame:CGRectMake(self.loginView.frame.origin.x, self.loginView.frame.origin.y - 500, self.loginView.frame.size.width, self.loginView.frame.size.height)];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [wview.loginView setFrame:CGRectMake(wview.loginView.frame.origin.x, wview.loginView.frame.origin.y + 500, wview.loginView.frame.size.width, wview.loginView.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    self.userIdTextField.tag = 1;
    self.passwordTextField.tag = 2;
    
    self.userIdTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginEvent:(id)sender {
    
    NSString *userId = self.userIdTextField.text;
    NSString *password = self.passwordTextField.text;
    
    NSLog(@"user Id : %@, password : %@", userId, password);
    
    
    
    [self.userIdTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    
    if([self isCheckLoginWithID:userId userPW:password]) {
        
        [self.defaults setBool:YES forKey:@"autologin"];
        
        MainTableViewController *tableView = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
        
        [self.navigationController pushViewController:tableView animated:YES];
    }
    else {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"로그인 실패" message:@"아이디 또는 패스워드를 확인해주세요" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
   
    
}
    

- (BOOL)isCheckLoginWithID:(NSString *)userID userPW:(NSString *)userPW {
    
    
    BOOL isExist = NO;
    
    
    NSMutableDictionary *dic = [[DataCenter sharedInstance] userDictionary];

    NSDictionary *userInfo = [dic objectForKey:userID];
    
    if([userID isEqualToString:[userInfo objectForKey:@"userid"]] && [userPW isEqualToString:[userInfo objectForKey:@"password"]]){
        
        isExist = YES;
        
    }
    
    return isExist;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [self playAnimation]; 
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"aa");
    if(textField.tag == 1) {
        NSLog(@"userid");
        [self.passwordTextField becomeFirstResponder];
    } else if(textField.tag == 2) {
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}

@end
