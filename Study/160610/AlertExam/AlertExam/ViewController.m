//
//  ViewController.m
//  AlertExam
//
//  Created by LEEJIHO on 2016. 6. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)openAlert:(id)sender {
    
    // Destructive, Cancel은 각 Controller당 한개씩 밖에 넣을 수 없음
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Show Alert!" preferredStyle:UIAlertControllerStyleAlert];

    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"아이디를 입력하세요."];
        
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"비밀번호를 입력하세요"];
        [textField setSecureTextEntry:YES];
    }];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"%@, %@", alertController.textFields.firstObject.text, alertController.textFields.lastObject.text);
        
    }];
    
    UIAlertAction *destory = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"파괴");
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"취소");
    }];
    
    [alertController addAction:ok];
    [alertController addAction:destory];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

- (IBAction)openActionSheet:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ActionSheet" message:@"Show ActionSheet!" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *destory = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:nil];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:ok];
    [alertController addAction:destory];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
