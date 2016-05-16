//
//  main.m
//  TestScore
//
//  Created by LEEJIHO on 2016. 5. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculationScore.h"
#import "ToolBox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        CalculationScore *cs = [[CalculationScore alloc]init];
        ToolBox *tb = [[ToolBox alloc]init];
        
        /*
         배열을 이용한 점수 입력
         */
//        NSArray *score = [[NSArray alloc]initWithObjects:@90, @94, @81, @100, nil];
//        
//        for (NSNumber *s in score) {
//            [cs addSubjectScore:s.integerValue];
//        }
        
        /*
         개별 점수 입력
         */
        [cs addSubjectScore:90];
        [cs addSubjectScore:94];
        [cs addSubjectScore:81];
        [cs addSubjectScore:50];
        
        NSString *grade = [cs scoreToGrade:[cs averageScore]];
        CGFloat point = [cs gradeToPoint:grade];
        
        NSLog(@"총점은 : %zd점, 평균은 : %.2f점이다.", [cs totalScore], [cs averageScore]);
        NSLog(@"등급은 : %@급입니다.", grade);
        NSLog(@"학점은 : %.1f점입니다.", point);
        
        CGFloat sum = [tb addFirstNum:3 secondNum:2];
        CGFloat sub = [tb subFirstNum:5 secondNum:4];
        CGFloat mul = [tb multiFirstNum:8 secondNum:7];
        CGFloat div = [tb devideFirstNum:10 secondNum:7];
        
        NSLog(@"%f, %f, %f, %f", sum, sub, mul, div);
        
        CGFloat inchCenti = [tb inchToCentimeter:10];
        CGFloat centiInch = [tb centimeterToInch:15];
        CGFloat meterArea = [tb meterToArea:47];
        CGFloat areaMeter = [tb areaToMeter:33];
        CGFloat fc = [tb fahrenheitToCelsius:17];
        CGFloat cf = [tb centimeterToInch:22];
        CGFloat kbMb = [tb kiloToMega:10493];
        CGFloat mbGb = [tb megaToGiga:401041];
        
        CGFloat roundN = [tb roundNumber:4.793257 length:6];
        
        
        
        NSLog(@"%.2f cm, %.2f inch, %.2f 평, %.2f meter, %.2f 섭씨, %.2f 화씨, %.2f MB, %.2f GB", inchCenti, centiInch,meterArea, areaMeter,fc,cf,kbMb, mbGb);
        
        
        NSLog(@"%f", roundN);
        
        NSLog(@"%f", [tb roundLimitNumber:4.793257]);
        
        
    }
    return 0;
}
