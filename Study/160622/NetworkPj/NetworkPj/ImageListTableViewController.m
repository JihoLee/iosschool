//
//  ImageListTableViewController.m
//  NetworkPj
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "ImageListTableViewController.h"
#import "DetailImageViewController.h"
#import "RequestObject.h"

@interface ImageListTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) UIImagePickerController *imagePicker;
@property (nonatomic) UIImage *selectedImage;
@property (nonatomic) NSString *imageName;

/*
 --- 임시
 */

@property (nonatomic) NSMutableArray *imageArray;
@property (nonatomic) NSMutableArray *nameArray;

@end

@implementation ImageListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    if([userId length] > 0) {
        self.title = [NSString stringWithFormat:@"%@번님, 환영합니다.", userId];
    }
    else {
        self.title = @"Images";
    }
    
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setAllowsEditing:NO];
    [imagePicker setDelegate:self];
    
    self.imagePicker = imagePicker;
    
    self.imageArray = [[NSMutableArray alloc] initWithCapacity:1];
    self.nameArray = [[NSMutableArray alloc] initWithCapacity:1];
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    if ([userId length] == 0) {
        [self showInputIdentifyAlert];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.imageArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = [self.imageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.nameArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)showInputIdentifyAlert {
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"유저 아이디" message:@"유저 아이디를 입력해주세요." preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"100~120 사이의 숫자"];
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *userIdTextField = [[controller textFields] firstObject];
        NSString *userId = [userIdTextField text];
        
        if([userId integerValue] > 120 || [userId integerValue] < 100) {
            
            NSLog(@"100과 120사이의 숫자를 입력하세요.");
            [self showInputIdentifyAlert];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            
            self.title = [NSString stringWithFormat:@"%@번님, 환영합니다.", userId];
        }
        
    }];
    
    [controller addAction:okAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)showInputImageNameAlert {
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"사진제목" message:@"사진제목을 입력해주세요." preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"사진제목"];
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *imageNameTextField = [[controller textFields] firstObject];
        NSString *imageName = [imageNameTextField text];
        
        self.imageName = imageName;
        
        // RequestObject로 데이터를 보내서 서버에 업로드
        RequestObject *request = [[RequestObject alloc] init];
        [request uploadImage:self.selectedImage name:self.imageName];
        
        
        [self.nameArray addObject:self.imageName];
        [self.imageArray addObject:self.selectedImage];
        
        [self.tableView reloadData];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [controller addAction:okAction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)refleshTableView:(id)sender {
    
    [self.tableView reloadData];
}

- (IBAction)showImageViewController:(id)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    self.selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
//    NSLog(@"selectedImage : %@", self.selectedImage);
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self showInputImageNameAlert];
    }];
    
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
    
    DetailImageViewController *detail = [segue destinationViewController];
    // 나중에 선택한 셀의 이미지로 변경
    [detail setSelectedImage:self.selectedImage];
    [detail setImageName:self.imageName];
    
}


@end
