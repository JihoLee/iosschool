//
//  DetailViewController.m
//  TableViewExample
//
//  Created by LEEJIHO on 2016. 6. 7..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DetailViewController.h"
#import "DataCenter.h"

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *animalImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.animalName;

    
    NSString *imageName = [[DataCenter defaultData] imageNameWithAnimal:self.animalName];
    
    NSLog(@"imageName : %@", imageName);
    [self.animalImageView setImage:[UIImage imageNamed:imageName]];
    
    // Do any additional setup after loading the view.
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
