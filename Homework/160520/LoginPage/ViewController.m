//
//  ViewController.m
//  LoginPage
//
//  Created by LEEJIHO on 2016. 5. 20..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewController.h"

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
        
        MainTableViewController *tableView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTable"];
        
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
    
    if([userID isEqualToString:[self.defaults objectForKey:@"userid"]] && [userPW isEqualToString:[self.defaults objectForKey:@"password"]]) {
        
        isExist = YES;
        
    }
    
    return isExist;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [self playAnimation]; 
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    [self playAnimation];
    
//    [UIView animateWithDuration:1 animations:^{
//        [self.loginView setFrame:CGRectMake(50, 50, 500, 200)];
//    } completion:^(BOOL finished) {
//        
//    }];
    
//    if(textField == self.userIdTextField) {
//        [self.userIdTextField becomeFirstResponder];
//    }
//    else if(textField == self.passwordTextField) {
//        
//        [self.passwordTextField becomeFirstResponder];
//    }
    
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if([identifier isEqualToString:@"SIGN_UP"]) {
        return YES;
    }
    else {
        // Segue Identifier가 두개이면 분기를 해줘야 함
        if([self isCheckLoginWithID:self.userIdTextField.text userPW:self.passwordTextField.text]) {
            
            return YES;
        }
        else {
            return NO;
        }

    }
    
    return NO;
    
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
