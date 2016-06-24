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
@property (nonatomic) NSString *userId;

@property (nonatomic) NSArray *result;

@property (nonatomic, strong) RequestObject *request;

@end

@implementation ImageListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RequestObject *request = [RequestObject requestInstance];
    self.request = request;
    self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    if([self.userId length] > 0) {
        self.title = [NSString stringWithFormat:@"%@번님, 환영합니다.", self.userId];
    }
    else {
        self.title = @"Images";
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTable) name:ImageListUpdatedNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestImageList) name:ImageUploadDidSuccessNotification object:nil];

    [self requestImageList];
    
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
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    if ([userId length] == 0) {
        [self showInputIdentifyAlert];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
}

- (void)refreshTable {
    
    self.result = [self.request imageInfoJSONArray];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self refleshTableView];
    });
    
    
    
    
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

    return [self.result count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *imageInfo = self.result[indexPath.row];
    
    NSString *imageTitle = imageInfo[JSONKeyImageTitle];
    cell.textLabel.text = imageTitle;
    
    NSString *thumbnailURLString = imageInfo[JSONKeyThumbnailURL];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 동기코드이기때문에 이미지를 받아올 때까지 화면이 정지함
//    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbnailURL]];
    
    // 비동기코드
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            UIImage *image = [UIImage imageWithData:data];
            if(image) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 테이블뷰의 indexPath에 해당하는 셀을 가져옴
                    UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
                    cellForUpdate.imageView.image = image;
                });
            }
        }
    }];
    
    [task resume];
    
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
        self.userId = [userIdTextField text];
        
        if([self.userId integerValue] > 120 || [self.userId integerValue] < 100) {
            
            NSLog(@"100과 120사이의 숫자를 입력하세요.");
            [self showInputIdentifyAlert];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setObject:self.userId forKey:@"userId"];
            
            self.title = [NSString stringWithFormat:@"%@번님, 환영합니다.", self.userId];
            
        
            [self requestImageList];
        }
        
    }];
    
    [controller addAction:okAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)requestImageList {
    [self.request setUserID:self.userId];
    [self.request requestImageList];
    
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
        [self.request setUserID:[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]];
        [self.request uploadImage:self.selectedImage title:self.imageName];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [controller addAction:okAction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)refleshTableView {
    
    [self.tableView reloadData];
}

- (IBAction)showImageViewController:(id)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    self.selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
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
    
    NSIndexPath *indexPath = [(UITableView *)self.tableView indexPathForCell: self];
    NSLog(@"indexPath : %@", indexPath);

    
}


@end
