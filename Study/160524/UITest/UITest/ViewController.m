//
//  ViewController.m
//  UITest
//
//  Created by LEEJIHO on 2016. 5. 24..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

}

- (void)createDoubleView {
    
        const CGFloat VIEW_HALF_WIDTH = self.view.frame.size.width / 2;
        const CGFloat VIEW_HEIGHT = self.view.frame.size.height;
    
    
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_HALF_WIDTH, VIEW_HEIGHT)];
        [leftView setBackgroundColor:[UIColor redColor]];
    
    
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_HALF_WIDTH, VIEW_HEIGHT / 3)];
        [topView setBackgroundColor:[UIColor blueColor]];
    
        [leftView addSubview:topView];
        [self.view addSubview:leftView];
    
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_HALF_WIDTH, 0, VIEW_HALF_WIDTH, VIEW_HEIGHT)];
        [rightView setBackgroundColor:[UIColor blueColor]];
    
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, rightView.frame.size.height - VIEW_HALF_WIDTH, VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];
        [bottomView setBackgroundColor:[UIColor redColor]];
    
        [rightView addSubview:bottomView];
        [self.view addSubview:rightView];
    
    
    
        [self.view addSubview:leftView];
}

- (void)viewAndLabel {
    
    
        const CGFloat VIEW_MARGIN = 20;
        CGFloat offsetY = 20;
    
    
        CGSize labelSize = CGSizeMake(self.view.frame.size.width - VIEW_MARGIN * 2, 30);
    
        UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2)];
    //    [firstView setBackgroundColor:[UIColor grayColor]];
    
        [self.view addSubview:firstView];
    
    
        UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
        [firstLabel setText:@"예제 화면 입니다."];
        [firstLabel setTextColor:[UIColor blackColor]];
        [firstLabel setTextAlignment:NSTextAlignmentLeft];
        [firstView addSubview:firstLabel];
    
        offsetY += firstLabel.frame.size.height;
    
        UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
        [secondLabel setText:@"예제 레이블 입니다."];
        [secondLabel setTextColor:[UIColor redColor]];
        [secondLabel setTextAlignment:NSTextAlignmentRight];
        [firstView addSubview:secondLabel];
    
        offsetY += secondLabel.frame.size.height;
    
    
        UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, 300, 150)];
        [secondView setBackgroundColor:[UIColor blackColor]];
        [firstView addSubview:secondView];
    
    
        UILabel *fouthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, secondView.frame.size.height - labelSize.height, secondView.frame.size.width, labelSize.height)];
        [fouthLabel setText:@"View위에 레이블 입니다."];
        [fouthLabel setTextColor:[UIColor whiteColor]];
        [fouthLabel setTextAlignment:NSTextAlignmentRight];
        [secondView addSubview:fouthLabel];
    
        offsetY += secondView.frame.size.height;
    
        UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
        [thirdLabel setText:@"중앙에 있는 레이블 입니다."];
        [thirdLabel setTextColor:[UIColor blackColor]];
        [thirdLabel setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:thirdLabel];
    
        offsetY += thirdLabel.frame.size.height;
    
    
        UILabel *fifthLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
        [fifthLabel setText:@"폰트는 20입니다."];
        [fifthLabel setTextColor:[UIColor blackColor]];
        [fifthLabel setFont:[UIFont fontWithName:@"나눔고딕" size:20]];
        [fifthLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.view addSubview:fifthLabel];
}

- (void)viewInView {
    
        const NSInteger margin = 20;
        const CGFloat VIEW_WITH = self.view.frame.size.width;
        const CGFloat VIEW_HEIGHT = self.view.frame.size.height;
    
        UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(margin, margin, VIEW_WITH - 2 * margin, VIEW_HEIGHT - 2 * margin)];
        [firstView setBackgroundColor:[UIColor blackColor]];
    
        [self.view addSubview:firstView];
    
    
        UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(margin, margin, firstView.frame.size.width - 2 * margin, firstView.frame.size.height - 2 * margin)];
        [secondView setBackgroundColor:[UIColor yellowColor]];
    
        [firstView addSubview:secondView];
}

- (void)createImageView {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 40)];
    
    [imageView setImage:[UIImage imageNamed:@"01"]];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
