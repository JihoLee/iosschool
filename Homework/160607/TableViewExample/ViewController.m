//
//  ViewController.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "DetailViewController.h"



@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) NSArray *animalList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    tv.delegate = self;
    tv.dataSource = self;
    
    [self.view addSubview:tv];
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self loadAnimalSection:section] count];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[DataCenter defaultData] sectionTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *titleArray = [[DataCenter defaultData] sectionTitles];
    
    return [titleArray objectAtIndex:section];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return [[DataCenter defaultData] sectionCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *animalName = [[self loadAnimalSection:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = animalName;
    cell.imageView.image = [UIImage imageNamed:[[DataCenter defaultData] imageNameWithAnimal:animalName]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // select 효과
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Push
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *dvc = [storyBoard instantiateViewControllerWithIdentifier:@"Detail"];
    
    NSString *animalName = [[self loadAnimalSection:indexPath.section] objectAtIndex:indexPath.row];
    
    [dvc setAnimalName:animalName];
    
    [self.navigationController pushViewController:dvc animated:YES];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (NSArray *)loadAnimalSection:(NSInteger) section {
    
    NSDictionary *allAnimals = [[DataCenter defaultData] allAnimals];
    NSString *key = [[[DataCenter defaultData] sectionTitles] objectAtIndex:section];
    NSArray *animalList = [allAnimals objectForKey:key];
    
    return animalList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
