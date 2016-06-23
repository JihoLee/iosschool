//
//  ViewController.m
//  GoogleImageDownload
//
//  Created by Jyo on 2016. 6. 23..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://v.phinf.naver.net/20160504_218/1462290628177jTGzQ_JPEG/upload_160504_%BE%D9%B9%FC%B1%E2%B3%E4_%BA%EA%C0%CC%BE%DB.jpg"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(data) {
            
            UIImage *image = [UIImage imageWithData:data];
            
            if(image) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.imageView.image = image;
                });
                
            } else {
                NSLog(@"no image");
            }
        } else {
            NSLog(@"no data");
        }
        
    }];
    
    [task resume];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
