//
//  FirstViewController.m
//  AloneCode
//
//  Created by Jyo on 2016. 6. 14..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "DataCenter.h"

@interface FirstViewController () <UITextViewDelegate, UITabBarControllerDelegate>




@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Load FirstViewController");
    
//    [self drawUI];
    self.textView.delegate = self;
    self.tabBarController.delegate = self;
    [self.textView setText:@""];
    [self.textView setFont:[UIFont fontWithName:@"Arial" size:20.0]];
    
    [self.textView becomeFirstResponder];
    
    [self.label setText:@""];
    [self.label setFont:[UIFont fontWithName:@"Arial" size:20.0]];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidekeyboard)];
    
    tap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tap];
}

- (void)drawUI {
    
    CGFloat width = self.view.frame.size.width / 2;
    CGFloat height = self.view.frame.size.height;
    NSInteger margin = 20;
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, margin, width, height)];
    [textView setText:@""];
    [textView setFont:[UIFont fontWithName:@"Arial" size:20.0]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width, margin, width, height)];
    [label setText:@""];
    [label setFont:[UIFont fontWithName:@"Arial" size:20.0]];
    
    [self.view addSubview:textView];
    [self.view addSubview:label];
    
    self.textView = textView;
    self.label = label;
    
}

- (IBAction)pushNavi:(id)sender {
    
    SecondViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Second"];
    
    [[DataCenter sharedInstance] setGiveValue:self.textView.text];
    
    [svc setMoveValue:0];
    [self.navigationController pushViewController:svc animated:YES];
    
}

- (IBAction)modalNavi:(id)sender {
    
    SecondViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Second"];
    
    [[DataCenter sharedInstance] setGiveValue:self.textView.text];
    
    [svc setMoveValue:1];
    [self presentViewController:svc animated:YES completion:nil];
    
}

- (void)textViewDidChange:(UITextView *)textView {
    
    [self.label setText:self.textView.text];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [[DataCenter sharedInstance] setGiveValue:self.textView.text];
    
    return YES;
    
}

- (void)hidekeyboard {
    
    [self.textView endEditing:YES];
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
