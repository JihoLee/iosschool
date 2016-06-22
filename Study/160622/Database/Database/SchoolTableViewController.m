//
//  SchoolTableViewController.m
//  Database
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "SchoolTableViewController.h"
#import "AppDelegate.h"
#import "School+CoreDataProperties.h"

@interface SchoolTableViewController ()

@property (nonatomic, weak) AppDelegate *appDelegate;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) NSMutableArray <School *> *schools;

@end

@implementation SchoolTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.appDelegate = appDelegate;
    
    // AppDelegate에 있는 managedObjectContext를 Fetch
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // 어떤 자료를 가져올지 Request에 담음
    // School에 있는 데이터를 달라는 요청서를 만듬
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"School"];
    // 에러
    NSError *fetchError = nil;
    // 관리객체콘텍스트에 요청서를 제출
    NSArray<School *> *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    
    
    NSLog(@"School array  %@, fetch Error : %@", fetchResult, fetchError);
    
    if(fetchError != nil) {
        NSLog(@"Error occured  %@", fetchError);
    }
    else {
        NSLog(@"Fetch Success");
        self.schools = [NSMutableArray arrayWithArray:fetchResult];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickAddButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"School" message:@"추가할 School 이름 입력" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = [[alert textFields] objectAtIndex:0];
        NSString *inputText = textField.text;
        
        if([inputText length] != 0) {
            
            NSLog(@"%@", inputText);
            [self saveNewSchoolEntity:inputText];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];

    [alert addAction:addAction];
    [alert addAction:cancelAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"School 이름"];
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)saveNewSchoolEntity:(NSString *)name {
    
    NSLog(@"saveName : %@", name);
    // 객체 생성
    School *schoolToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:self.managedObjectContext];
    
    [schoolToAdd setName:name];
    
    [self.appDelegate saveContext];
    [self.schools addObject:schoolToAdd];
    
    [self.tableView reloadData];
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.schools count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    School *data = [self.schools objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [data name];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
