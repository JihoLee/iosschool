//
//  ViewController.m
//  AloneCode
//
//  Created by Jyo on 2016. 6. 13..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

#define MARGIN 20
#define CUSTOM_HEIGHT 30
#define NAVI_HEIGHT 64

@interface ViewController () <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel *outputLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *moveButton;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self drawUI];
    // 텍스트필드 delegate 추가
    self.inputTextField.delegate = self;
    
    // 텍스트필드 리턴키 타입(Custom 불가)
    [self.inputTextField setReturnKeyType:UIReturnKeySend];
    
    // 키보드 올리기
    [self.inputTextField becomeFirstResponder];
    
    /*
     제스쳐 추가
     - 화면을 2회탭하면 텍스트필드 키보드가 내려감
     */
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)finishInput {
    // 키보드 내리기
    [self.inputTextField endEditing:YES];
    
}

- (void)drawUI {
    
    UITextField *inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(MARGIN, MARGIN + NAVI_HEIGHT, self.view.frame.size.width - MARGIN * 5, CUSTOM_HEIGHT)];
    
    [inputTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(inputTextField.frame.size.width + MARGIN * 2, MARGIN + NAVI_HEIGHT, MARGIN * 2, CUSTOM_HEIGHT)];
    
    [button setTitle:@"완료" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectInputButton) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, inputTextField.frame.size.height + MARGIN * 2 + NAVI_HEIGHT, inputTextField.frame.size.width, CUSTOM_HEIGHT)];
    
    UIButton *moveViewButton = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, label.frame.origin.y + MARGIN * 2, MARGIN * 10, CUSTOM_HEIGHT)];
    
    [moveViewButton setTitle:@"다음 화면으로!" forState:UIControlStateNormal];
    [moveViewButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [moveViewButton addTarget:self action:@selector(moveView) forControlEvents:UIControlEventTouchUpInside];
    
//    [moveViewButton setBackgroundColor:[UIColor grayColor]];
    [moveViewButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [label setText:@""];
    [label setTextColor:[UIColor blackColor]];
    
    self.inputTextField = inputTextField;
    self.button = button;
    self.outputLabel = label;
    self.moveButton = moveViewButton;
    
    [self.view addSubview:inputTextField];
    [self.view addSubview:button];
    [self.view addSubview:label];
    [self.view addSubview:moveViewButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectInputButton {
    
    if([self.inputTextField.text length] == 0) {
        
        NSLog(@"텍스트필드를 입력하세요.");
        
    }
    else {
        
        [self.outputLabel setText:self.inputTextField.text];
        [self.inputTextField endEditing:YES];
    }
    
}

- (void)moveView {
    
    SecondViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
    
//    [second setSecondValue:self.outputLabel.text];
    
    [self.navigationController pushViewController:second animated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self selectInputButton];

    return YES;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    [self.inputTextField endEditing:YES];
    
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
     [self.outputLabel setText:@""];
     
     SecondViewController *second = [segue destinationViewController];
     
     [second setSecondValue:self.outputLabel.text];
 }
 */

@end
