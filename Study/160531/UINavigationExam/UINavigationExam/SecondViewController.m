//
//  SecondViewController.m
//  UINavigationExam
//
//  Created by LEEJIHO on 2016. 5. 31..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Title"];
    
    [self createSegmentInNavigation];
    [self createSegmentInToolbar];
    /*
     UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 35)];
     
     title.text = @"타이틀";
     
     self.navigationItem.titleView = title;
     */
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) createSegmentInNavigation {
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Up", @"Down", nil]];
    [segment setTag:1];
    
    [segment addTarget:self action:@selector(segmentEvent:) forControlEvents:UIControlEventValueChanged];
    //    segment.frame = CGRectMake(0, 0, 120, 35);
    segment.momentary = YES;
    
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segment];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
}

- (void) createSegmentInToolbar {
    
    [self.navigationController setToolbarHidden:NO];
    
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Ascending", @"Descending", nil]];
    [segmentControl setTag:2];
    [segmentControl setSelectedSegmentIndex:0];
    [segmentControl addTarget:self action:@selector(segmentEvent:) forControlEvents:UIControlEventValueChanged];
    
    
    UIBarButtonItem *segment = [[UIBarButtonItem alloc] initWithCustomView:segmentControl];
    
    self.toolbarItems = [NSArray arrayWithObjects:flexibleSpaceItem, segment, flexibleSpaceItem, nil];
    
}

- (void) segmentEvent:(UISegmentedControl *)sender {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButton:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 1. 객체생성
    ViewController *viewC = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
    // 2. Push
    [self.navigationController pushViewController:viewC animated:YES];
//    [self presentViewController:viewC animated:YES completion:nil];
    
    
    
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
