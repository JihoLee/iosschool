//
//  ViewController.m
//  LoginPage
//
//  Created by LEEJIHO on 2016. 5. 20..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *userIdTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if(textField == self.userIdTextField) {
        [self.userIdTextField becomeFirstResponder];
    }
    else if(textField == self.passwordTextField) {
        
        [self.passwordTextField becomeFirstResponder];
    }
    
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
