//
//  ViewController.m
//  UIControl
//
//  Created by LEEJIHO on 2016. 5. 26..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIButton *lastSelected;
@property (nonatomic, weak) UITextField *textField;

@property (nonatomic, weak) UILabel *resultLabel;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    
    textField.font = [UIFont systemFontOfSize:15];
    textField.textColor = [UIColor blackColor];
    
    textField.textAlignment = NSTextAlignmentCenter;
    
    textField.borderStyle = UITextBorderStyleBezel;
    
    textField.placeholder = @"Testing..";
    
    textField.delegate = self;
    [self.view addSubview:textField];

    
    
    self.textField = textField;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(270, 100, 50, 30)];
    [button setTitle:@"확인" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(showTextToLabel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 30)];
    
    [resultLabel setTextColor:[UIColor blackColor]];
    
    [self.view addSubview:resultLabel];
    
    self.resultLabel = resultLabel;
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showTextToLabel {
    
    NSString *result = self.textField.text;
    
    self.resultLabel.text = [NSString stringWithFormat:@"결과 : %@", result];
    
    [self.textField resignFirstResponder];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    NSLog(@"call textFieldShouldBeginEditing delegate method");
    
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.textField becomeFirstResponder];
    NSLog(@"call textFieldDidBeginEditing delegate method");
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    [self.textField resignFirstResponder];
    NSLog(@"call textFieldShouldReturn delegate method");
    return YES;
    
}
                              
- (void)createFourButton {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(30, 150, 100, 35)];
    [btn addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:1];
    [btn setTitle:@"1번 버튼" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(140, 150, 100, 35)];
    [btn1 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTag:2];
    
    [btn1 setTitle:@"2번 버튼" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [btn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    
    [self.view addSubview:btn1];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setFrame:CGRectMake(30, 200, 100, 35)];
    [btn3 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTag:3];
    
    [btn3 setTitle:@"3번 버튼" forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn3 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [btn3 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setFrame:CGRectMake(140, 200, 100, 35)];
    [btn4 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTag:4];
    
    [btn4 setTitle:@"4번 버튼" forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn4 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [btn4 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    
    [self.view addSubview:btn4];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 200, 35)];
    
    label.textColor = [UIColor blackColor];
    
    [self.view addSubview:label];
    self.label = label;
                                  
}

// sender는 눌린 버튼의 객체
- (void)onTouchUpInsideBtn:(UIButton *)sender {
    
    
    
    if(sender.selected) {
        
        sender.selected = NO;
    }
    else {
        self.lastSelected.selected = NO;
        sender.selected = YES;
    }
    
   
    
    
    NSInteger tag = sender.tag;
    self.label.text = [NSString stringWithFormat:@"선택된 버튼은 : %ld번 버튼",  (long)tag];
    
    self.lastSelected = sender;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
