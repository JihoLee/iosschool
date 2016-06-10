//
//  ViewController.m
//  ImagePickerExam
//
//  Created by LEEJIHO on 2016. 6. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


// User Interection Enable이 켜져있어야 실행됨
- (IBAction)callGestureMethod:(UITapGestureRecognizer *)sender {
    
    NSLog(@"call method");
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"사진소스선택" message:@"사진을 가져올 소스를 선택하세요." preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *library = [UIAlertAction actionWithTitle:@"라이브러리" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        
    }];
    
    UIAlertAction *cameraAlbum = [UIAlertAction actionWithTitle:@"카메라" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:library];
    [alertController addAction:cameraAlbum];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    
    // 소스타입이 사용자가 사용가능한 상태인지 여부 확인
    // 시뮬레이터에서는 카메라타입을 사용할 수 없으므로 실행이 안됨
    if([UIImagePickerController isSourceTypeAvailable:sourceType] == NO) {
        NSLog(@"이 소스는 못쓴단다");
        return;
        
    }
    
    UIImagePickerController *pickerController = [UIImagePickerController new];
    [pickerController setSourceType:sourceType];
    [pickerController setDelegate:self];
    
    [pickerController setAllowsEditing:YES];
    
    [self presentViewController:pickerController animated:YES completion:nil];
    
    
}

#pragma mark - UIImagePicker Controller Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    
    NSLog(@"info : %@", info);
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIImage *editImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [self.imageView setImage:editImage];
    
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];

    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
