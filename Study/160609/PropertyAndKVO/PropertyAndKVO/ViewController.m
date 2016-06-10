//
//  ViewController.m
//  PropertyAndKVO
//
//  Created by LEEJIHO on 2016. 6. 9..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UILabel *countLabel;

@end

@implementation ViewController


- (IBAction)clickButton:(id)sender {
    // @property로 선언된 변수인 count값이 증가하면 자동으로 set메소드가 호출되면서 값을 갱신함
    self.count ++;
    [self.countLabel setText:[NSString stringWithFormat:@"%ld", self.count]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
