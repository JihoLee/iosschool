//
//  SettingTableViewController.m
//  UITableViewCustomExam
//
//  Created by LEEJIHO on 2016. 6. 8..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "DataCenter.h"
#import "WeatherTableViewController.h"

@interface SettingTableViewController () <SettingTableViewCellDelegate>

@property (nonatomic) DataCenter *dataCenter;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataCenter = [DataCenter sharedInstance];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.dataCenter numberOfSectionsForSettingTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataCenter numberOfRowsForSettingTable:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [[self.dataCenter settingTableDataForSection:indexPath.section] objectAtIndex:indexPath.row];
    // 0번째 Section에서는 커스텀 셀, 1번째 Section에서는 default cell
    if(indexPath.section == 0) {
        
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        // 스토리보드에 안만들어져있는 상태이기 때문에 nil일 경우 하나 생성해줘야 함
        if(cell == nil) {
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
            
            cell.delegate = self;
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        [cell.textLabel setText:title];
        
        BOOL isFunctionOn = [self.dataCenter isOnForSetting:indexPath.row];
        
        NSLog(@"isFunctionOn : %d", isFunctionOn);
        [cell.settingSwitch setOn:isFunctionOn];
        
        return cell;
    } else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubtitleCell" forIndexPath:indexPath];
        
        [cell.textLabel setText:title];
        return cell;
    }
    
    
    // Configure the cell...
    
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Row Selected : %ld - %ld", indexPath.section, indexPath.row);
    
    if(indexPath.section == 0) {
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"ShowDetail" sender:sender];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.dataCenter settingTableHeaderTitleForSection:section];
    
}

#pragma mark - Setting Table View Cell delegate

- (void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn {
    
    // Cell이 어떤 Cell인지 판단 할 수 있음
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    
//    NSLog(@"Cell index : %ld-%ld, isOn : %d", cellIndex.section, cellIndex.row, isOn);
    
    [self.dataCenter setSetting:cellIndex.row isOn:isOn];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell *senderCell = (UITableViewCell *)sender;
    NSLog(@"segue will action : %@", senderCell.textLabel.text);
    
    WeatherTableViewController *tableViewController = [segue destinationViewController];
    
    if([senderCell.textLabel.text isEqualToString:@"한국날씨"]) {
        [tableViewController setWeatherType:WeatherTypeKorea];
    }
    else {
        [tableViewController setWeatherType:WeatherTypeWorld];
    }
    
    
    
}


@end
