//
//  RequestObject.m
//  NetworkPj
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "RequestObject.h"
#import "AFNetworking.h"

@interface RequestObject()

@end

@implementation RequestObject

+ (instancetype) requestInstance {
    
    static RequestObject *object = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[RequestObject alloc] init];
        
    });
    
    return object;
    
}

- (void)uploadImage:(UIImage *)image title:(NSString *)title {
    
    NSLog(@"image : %@, title : %@", image, title);

    NSString *url = @"http://ios.yevgnenll.me/api/images/";
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    
    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
    [bodyParams setObject:self.userID forKey:@"user_id"];
    [bodyParams setObject:title forKey:@"title"];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:bodyParams constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:imageData name:@"image_data" fileName:@"image.jpeg" mimeType:@"image/jpeg"];

        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                          
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                          
                          [[NSNotificationCenter defaultCenter] postNotificationName:ImageUploadDidSuccessNotification object:nil];
                      }
                  }];
    
    [uploadTask resume];
    
    
    /*
    NSString *boundary = @"----------yagom";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    
    NSString *imageUploadURLString = @"http://ios.yevgnenll.me/api/images/";
    
    NSURL *requestURL = [NSURL URLWithString:imageUploadURLString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:requestURL];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];

    NSMutableData *body = [NSMutableData data];
    
    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
    [bodyParams setObject:self.userID forKey:@"user_id"];
    [bodyParams setObject:title forKey:@"title"];
    
    NSData *boundaryData = [[NSString stringWithFormat:@"\n--%@\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
    
    for (NSString *key in bodyParams) {
        [body appendData:boundaryData];
        
        NSData *valueKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", key] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueKeyData];
        
        NSString *value = bodyParams[key];
        NSData *valueData = [[NSString stringWithFormat:@"%@\n", value] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueData];
    }
    
    [body appendData:boundaryData];
    
    NSData *imageKeyData = [[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\n"]] dataUsingEncoding:NSUTF8StringEncoding];
    
    [body appendData:imageKeyData];
    
    NSData *imageContentTypeData = [@"Content-Type: image/jpeg\n\n" dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [body appendData:imageData];
    
    // 처음넣는 boundaryData값과 조금 틀림
    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\n--%@--\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:finishBoundaryData];
    
    [request setHTTPBody:body];
    
    NSURLSession *session = [NSURLSession sharedSession];
    // fromData에는 보낼 data를 삽입해야하지만, 이미 위에서 setHTTPBody에 삽입한 상태이므로 nil로 둬도 무방
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error != nil) {
            
            NSLog(@"Error occured : %@", error);
            return;
        }

        if(data == nil) {
            NSLog(@"Data dosen't exist");
            return;
        }
        
        if(data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"dic : %@", dic);
            
            [[NSNotificationCenter defaultCenter] postNotificationName:ImageUploadDidSuccessNotification object:nil];
            
        }
        
    }];
    
    // Upload start
    [uploadTask resume];
    */
    

}

- (void)requestImageList {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://ios.yevgnenll.me/api/images/?user_id=%@", self.userID]];

    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if(!error) {
            NSLog(@"respon : %@", responseObject);
            if([[responseObject objectForKey:@"code"] isEqualToNumber:@200]) {
                
                NSLog(@"Success");
                
                NSArray *contentArray = responseObject[@"content"];
                self.imageInfoJSONArray = contentArray;
                
                [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdatedNotification object:nil];
                
            } else {
                
                [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdatedFailNotification object:nil];
                
            }
        }
    }];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [dataTask resume];
    
    // 기존 애플에서 제공하는 코드를 사용한 경우
    /*
    NSLog(@"user_id : %@", self.userID);
    NSString *URLString = [NSString stringWithFormat:@"http://ios.yevgnenll.me/api/images/?user_id=%@", self.userID];
    NSURL *requestURL = [NSURL URLWithString:URLString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:requestURL];
    __block NSDictionary *dict;
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(data) {
            dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            // 불러온 데이터가 정상데이터일경우 Notification을 통해 테이블뷰에 데이터 갱신을 요청
            if([dict[@"code"] isEqualToNumber:@200]) {
                
                NSLog(@"Success");
                
                NSArray *contentArray = dict[@"content"];
                self.imageInfoJSONArray = contentArray;
                
                [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdatedNotification object:nil];
            } else {
                
                [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdatedFailNotification object:nil];
            }
            
            NSLog(@"%@", self.imageInfoJSONArray);
            
        }
    }];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [dataTask resume];
     */
    
}

@end
