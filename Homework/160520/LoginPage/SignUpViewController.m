//
//  SignUpViewController.m
//  LoginPage
//
//  Created by LEEJIHO on 2016. 6. 4..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "SignUpViewController.h"
#import "DataCenter.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *useridTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *rePasswordTextField;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

// 회원가입
- (IBAction)signUpEvent:(id)sender {
    
    DataCenter *dataCenter = [DataCenter sharedInstance];
    
    // 아이디, 패스워드 빈칸여부
    if(![self.useridTextField.text isEqualToString:@""] || ![self.passwordTextField.text isEqualToString:@""] || ![self.rePasswordTextField.text isEqualToString:@""]) {
        
        // 두번 입력한 패스워드 일치여부 - 일치
        if([self.passwordTextField.text isEqualToString:self.rePasswordTextField.text]) {
            
            [dataCenter addUserIdAndPassword:self.useridTextField.text password:self.passwordTextField.text];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        // 불일치
        else {
            
            NSLog(@"fail");
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"비밀번호가 일치하지 않습니다" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
    }
    
}

// 회원가입 취소
- (IBAction)cancelEvent:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
