//
//  StudyDetailTableViewController.m
//  AloneCode
//
//  Created by 민지 김 on 2016. 6. 15..
//  Copyright © 2016년 i_log. All rights reserved.
//

#import "StudyDetailTableViewController.h"

@interface StudyDetailTableViewController ()

@end

@implementation StudyDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.tableTitle;

    NSLog(@"%ld",(long)self.data);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rowCount = 0;

    if(self.data == F_SCHOOL) {
        rowCount = [[[self.allData objectAtIndex:CLASS] objectAtIndex:F_SCHOOL] count];
    }else if(self.data == F_CAMP) {
        rowCount = [[[self.allData objectAtIndex:CLASS] objectAtIndex:F_CAMP] count];
    }else if(self.data == W_KOREA) {
        rowCount = [[[self.allData objectAtIndex:WEATHER] objectAtIndex:W_KOREA - 2] count];
    }else if(self.data == W_WORLD) {
        rowCount = [[[self.allData objectAtIndex:WEATHER] objectAtIndex:W_WORLD - 2] count];
    }
    
    return rowCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSInteger row = indexPath.row;
    
    if(self.data == F_SCHOOL) {
        cell.textLabel.text = [[[self.allData objectAtIndex:CLASS] objectAtIndex:F_SCHOOL] objectAtIndex:row];
        cell.detailTextLabel.text = @"";
    }else if(self.data == F_CAMP) {
        cell.textLabel.text = [[[self.allData objectAtIndex:CLASS] objectAtIndex:F_CAMP] objectAtIndex:row];
        cell.detailTextLabel.text = @"";
    }else if(self.data == W_KOREA) {
        cell.textLabel.text = [[[self.allData objectAtIndex:WEATHER] objectAtIndex:W_KOREA - 2] objectAtIndex:row];
        cell.detailTextLabel.text = [[[self.allData objectAtIndex:TEMPERACTURE] objectAtIndex:W_KOREA - 2] objectAtIndex:row];
    }else if(self.data == W_WORLD) {
        cell.textLabel.text = [[[self.allData objectAtIndex:WEATHER] objectAtIndex:W_WORLD - 2] objectAtIndex:row];
        cell.detailTextLabel.text = [[[self.allData objectAtIndex:TEMPERACTURE] objectAtIndex:W_WORLD - 2] objectAtIndex:row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
