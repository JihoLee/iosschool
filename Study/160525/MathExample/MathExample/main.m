//
//  main.m
//  MathExample
//
//  Created by LEEJIHO on 2016. 5. 25..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        NSInteger count = 10;
//        NSInteger nextNumber = 0;
//        NSMutableArray *pibonacci = [[NSMutableArray alloc] initWithObjects:@0,@1, nil];
//        
//        for (int i = 0; i < count - 1; i++) {
//            
//            NSInteger leftNumber = [[pibonacci objectAtIndex:i] integerValue];
//            NSInteger rightNumber = [[pibonacci objectAtIndex:i+1] integerValue];
//            
//            nextNumber = leftNumber + rightNumber;
//            
//            [pibonacci addObject:[NSNumber numberWithInteger:nextNumber]];
//        
//        }
//        
//        
//            NSLog(@"%@ ", [pibonacci objectAtIndex:count]);
//        
//        
//        
//        
//        
//        
//    }
//    return 0;
//}
int main(int argc, const char * argv[]) {
    
    int pibonacci[10000]={0,1};
    int n = 0;
    int nextNumber = 0;
    
    scanf("%d", &n);
    
    
    for (int i = 0; i < n ; i++) {
        
        int leftNumber = pibonacci[i];
        int rightNumber = pibonacci[i+1];
        
        nextNumber = leftNumber + rightNumber;
        
        pibonacci[i+2] = nextNumber;
//        printf("%d\n", pibonacci[i+2]);
    }
    
    
    printf("%d\n", pibonacci[n]);
//    int n = 0;
//    scanf("%d", &n);
//    int nemo[n];
//    int count = 1;
//    for (int i = 0; i < n; i++) {
//        nemo[i] = 1;
//    }
//    int result = 0;
//    for (int j = 0; j < n; j++) {
//        
//        result = nemo[j] + nemo[j+1];
//        
//        if(result == 1) {
//            count--;
//        }
//        else if(result == 2) {
//            count++;
//        }
//        
//        
//        
//    }
//    
//    for (int k = 0; k < n; k++) {
//        result = nemo[k] + nemo[k+1];
//        result = nemo[k+2] + nemo[k+3];
//        
//    }
//    
//    printf("%d\n", count);
    
    return 0;
}

//int main(int argc, const char * argv[]) {
//    
//    int n = 0;
//    int count = 0;
//    scanf("%d", &n);
//    
//    while (n != 1) {
//        if(n % 3 == 0) {
//            
//            n = n / 3;
//            count += 1;
//            continue;
//        }
//        
//        if(n % 2 == 0) {
//            
//            n = n / 2;
//            count += 1;
//            continue;
//        }
//        
//        if(n != 1) {
//            n -= 1;
//            continue;
//        }
//        
//        
//    }
//    
//    printf("%d\n", count);
//
//}