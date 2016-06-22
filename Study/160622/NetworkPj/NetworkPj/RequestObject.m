//
//  RequestObject.m
//  NetworkPj
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "RequestObject.h"

@interface RequestObject()

@end

@implementation RequestObject

+ (instancetype) requestInstance {
    
    static RequestObject *request = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[RequestObject alloc] init];
        
    });
    
    return request;
    
}

- (void)uploadImage:(UIImage *)image name:(NSString *)name {
    
    NSLog(@"selectImage : %@, name : %@", image, name);

}

- (NSMutableDictionary *)downloadImage {

    
    return nil;
}

@end
