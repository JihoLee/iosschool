//
//  RequestObject.h
//  NetworkPj
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *ImageListUpdatedNotification = @"ImageListUpdated";
static NSString *ImageListUpdatedFailNotification = @"ImageListUpdateFail";
static NSString *ImageUploadDidSuccessNotification = @"ImageUploadSuccess";
static NSString *ImageUploadDidFailNotification = @"ImageUploadFail";

static NSString *JSONKeyImageUrl = @"image_url";
static NSString *JSONKeyThumbnailURL = @"thumbnail_url";
static NSString *JSONKeyImageTitle = @"title";

@interface RequestObject : NSObject

@property (nonatomic, strong) NSArray<NSDictionary *> *imageInfoJSONArray; // 사용자가 요청한 데이터를 저장하는 배열
@property (nonatomic, strong) NSString *userID;

+ (instancetype) requestInstance;

- (void)uploadImage:(UIImage *)image title:(NSString *)title;
- (void)requestImageList;

@end
