//
//  main.m
//  ChosungConvert
//
//  Created by LEEJIHO on 2016. 5. 23..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
NSArray *chosungs;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        chosungs = [[NSArray alloc] initWithObjects:@"ㄱ", @"ㄲ",@"ㄴ", @"ㄷ", @"ㄸ",@"ㄹ", @"ㅁ", @"ㅂ", @"ㅃ",@"ㅅ",@"ㅆ", @"ㅇ", @"ㅈ",@"ㅉ", @"ㅊ", @"ㅋ", @"ㅌ", @"ㅍ", @"ㅎ", nil];
        
        NSString *name = @"ㅍㅅㅌabbb!!!@#!@#!#    ";
         NSLog(@"%@",name);
        NSMutableString *result = [NSMutableString string];
       
        
        for (NSUInteger i = 0; i < [name length]; i++) {
            
            unichar c = [name characterAtIndex:i];
            if(0xAC00 <= c && c <= 0xD7AF) {
            NSLog(@"%tu %C %zd", i, c, (NSInteger)c);
            
            // 21 *28 * 초성 + 28 * 중성 + 종성
            NSInteger x = (NSInteger)c - 0xAC00;
            
            NSLog(@"%zd 번째", x);
            // 27 * (20 * cho + jung) = x
            NSInteger jong = x % 28;
            // 27 * (20 + cho +jung) = x
            x = x - jong;
            // 20 * cho + jung = x
            x = x / 28;
            NSInteger jung = x % 21;
            x -= jung;
            // 20 * cho = x
            
            NSInteger cho = x / 21;
            NSString *chosung = chosungs[cho];
            NSLog(@"%C %zd 번째 초성 %@", c, cho, chosungs);
            
            [result appendString:chosung];
            
            }
            
            else {
                NSString *letter = [name substringWithRange:NSMakeRange(i, 1)];
                NSLog(@"예외 : %@", letter);
                NSUInteger index = [chosungs indexOfObject:letter];
                NSLog(@"인덱스 : %tu", index);
                
                if(index != NSNotFound) {
                    [result appendString:letter];
                }
            }
        }
        
        NSString *converted = result;
        
        converted = [converted stringByReplacingOccurrencesOfString:@"ㄱㄱ" withString:@"ㄲ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㄷㄷ" withString:@"ㄸ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅂㅂ" withString:@"ㅃ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅅㅅ" withString:@"ㅆ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅈㅈ" withString:@"ㅉ"];
        
        
        NSLog(@"%@", result);
        NSLog(@"%@", converted);

    }
    return 0;
}
