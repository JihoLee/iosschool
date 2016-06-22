//
//  RequestObject.h
//  NetworkPj
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject

+ (instancetype) requestInstance;

- (void)uploadImage:(UIImage *)image name:(NSString *)name;
- (NSMutableArray *)downloadImage;

@end
