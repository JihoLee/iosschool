//
//  ViewController.m
//  UIScrollView
//
//  Created by LEEJIHO on 2016. 5. 27..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger width = self.view.frame.size.width;
    NSInteger height = self.view.frame.size.height;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width * 3, scrollView.frame.size.height)];
    [scrollView setPagingEnabled:YES];
    [scrollView setBounces:NO];
    [scrollView setMinimumZoomScale:1.0f];
    [scrollView setMaximumZoomScale:3.0f];
    
    scrollView.delegate = self;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(width * 2, 0, width, height)];
    
    [imageView1 setImage:[UIImage imageNamed:@"wallpaper1"]];
    [imageView2 setImage:[UIImage imageNamed:@"wallpaper2"]];
    [imageView3 setImage:[UIImage imageNamed:@"wallpaper3"]];
    
    [scrollView addSubview:imageView1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];
    
    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
    NSLog(@"scroll");
}

@end
