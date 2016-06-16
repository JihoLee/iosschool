//
//  ExamTableViewController.m
//  AloneCode
//
//  Created by 민지 김 on 2016. 6. 15..
//  Copyright © 2016년 i_log. All rights reserved.
//

#import "ExamTableViewController.h"
#import "DataCenter.h"
#import "CustomTableViewCell.h"
#import "StudyDetailTableViewController.h"



@interface ExamTableViewController ()
@property (nonatomic, strong) DataCenter *dataCenter;

@property(nonatomic, strong) NSMutableArray *classList;
@property(nonatomic, strong) NSMutableArray *weatherList;
@property(nonatomic, strong) NSMutableArray *temperatureList;

@property(nonatomic, strong) NSArray *allData;
@end

@implementation ExamTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataCenter = [DataCenter sharedInstance];
    
    self.title = @"테이블 뷰 연습";
    
    self.classList = [[NSMutableArray alloc] initWithObjects:@[@"iOS", @"Android",@"Web Front"], @[@"iOS 입문", @"iOS 초급", @"iOS 중급"], nil];
    
    self.weatherList = [[NSMutableArray alloc] initWithObjects:@[@"서울", @"대전",@"대구", @"부산", @"제주"], @[@"뉴욕", @"서울", @"도쿄", @"멜버른", @"타이페이"], nil];
    
    self.temperatureList = [[NSMutableArray alloc] initWithObjects:@[@"32.2", @"33.7",@"34.1", @"29.4", @"30.1"], @[@"28.1", @"32.2", @"30.4", @"28.5", @"26.7"], nil];
    
    self.allData = [NSArray arrayWithObjects:self.classList, self.weatherList, self.temperatureList, nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.dataCenter sectionCount];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataCenter countForSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    CustomTableViewCell *customCell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    
    
    /*
     
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
     
    // 코드로 테이블뷰를 생성할 때는 처음에 cell이 생성되어있지 않기때문에 cell을 먼저 생성해줘야 함.
    if(cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
     
    }
     */
    
//    if(indexPath.section == 0) {
//        cell.backgroundColor = [UIColor greenColor];
//        cell.accessoryType = UITableViewCellAccessoryDetailButton;
//    }else {
//        cell.backgroundColor = [UIColor lightGrayColor];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    
    NSString *imageName = [[self.dataCenter imageForSection:indexPath.section] objectAtIndex:indexPath.row];
    customCell.cellLabel.text = [[self.dataCenter listForSection:indexPath.section] objectAtIndex:indexPath.row];
    customCell.cellImageView.image = [UIImage imageNamed:imageName];
    customCell.cellSwitch.tag = indexPath.row;
    
    // 스위치 보이기
    if(indexPath.section == 0) {
        if(customCell.cellSwitch.tag == 0) {
            NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"school"]);
            
            if([[[NSUserDefaults standardUserDefaults] objectForKey:@"school"] isEqualToString:@"on"]) {
                [customCell.cellSwitch setOn:YES];
            }else {
                [customCell.cellSwitch setOn:NO];
            }
        }else if(customCell.cellSwitch.tag == 1) {
            NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"camp"]);
            if([[[NSUserDefaults standardUserDefaults] objectForKey:@"camp"] isEqualToString:@"on"]) {
                [customCell.cellSwitch setOn:YES];
            }else {
                [customCell.cellSwitch setOn:NO];
            }
        }
    }
    
    else if(indexPath.section == 1) {
        customCell.cellSwitch.hidden = YES;
        customCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [customCell.cellSwitch addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    
//    cell.textLabel.text = [[self.dataCenter listForSection:indexPath.section] objectAtIndex:indexPath.row];
    
    return customCell;
}

- (void)changeValue:(UISwitch *)sw {
    
    if(sw.tag == 0) {
        if([sw isOn]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"on" forKey:@"school"];
            
            NSLog(@"%zd번 스위치 : OFF =====> ON", sw.tag);
        }else {
            [[NSUserDefaults standardUserDefaults] setObject:@"off" forKey:@"school"];
            NSLog(@"%zd번 스위치 : ON =====> OFF", sw.tag);
        }
    }else if(sw.tag == 1) {
        if([sw isOn]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"on" forKey:@"camp"];
             NSLog(@"%zd번 스위치 : OFF =====> ON", sw.tag);
        }else {
            [[NSUserDefaults standardUserDefaults] setObject:@"off" forKey:@"camp"];
            NSLog(@"%zd번 스위치 : ON =====> OFF", sw.tag);
        }
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return [self.dataCenter heightForSection:indexPath.section];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

        StudyDetailTableViewController *sdtv = [self.storyboard instantiateViewControllerWithIdentifier:@"studyDetail"];
    
        if(indexPath.section == 0 && indexPath.row == 0) {
            [sdtv setData:F_SCHOOL];
        }else if(indexPath.section == 0 && indexPath.row == 1) {
            [sdtv setData:F_CAMP];
        }else if(indexPath.section == 1 && indexPath.row == 0) {
            [sdtv setData:W_KOREA];
        }else if(indexPath.section == 1 && indexPath.row == 1) {
            [sdtv setData:W_WORLD];
        }
    [sdtv setTableTitle:[[self.dataCenter listForSection:indexPath.section] objectAtIndex:indexPath.row]];
    [sdtv setAllData:self.allData];
    [self.navigationController pushViewController:sdtv animated:YES];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.dataCenter titleForSection:section];
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
