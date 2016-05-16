//
//  ToolBox.m
//  TestScore
//
//  Created by LEEJIHO on 2016. 5. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ToolBox.h"


@implementation ToolBox

- (CGFloat) addFirstNum:(CGFloat)first secondNum:(CGFloat)second {
    
    return [self roundThree:(CGFloat)first+second];
}

- (CGFloat) subFirstNum:(CGFloat)first secondNum:(CGFloat)second {
    
     return [self roundThree:(CGFloat)first-second];
}

- (CGFloat) multiFirstNum:(CGFloat)first secondNum:(CGFloat)second {
    
    return [self roundThree:(CGFloat)first*second];
}

- (CGFloat) devideFirstNum:(CGFloat)first secondNum:(CGFloat)second {
    
    
    return [self roundThree:(CGFloat)first/second];
}

- (CGFloat) roundThree:(CGFloat) num {
    
//    CGFloat f = (num + 0.0005);
//    CGFloat a = (int)((num + 0.0005) * 1000);
//    CGFloat b = ((CGFloat)((int)((num + 0.0005) * 1000)) / 1000);
//    
    return ((CGFloat)((int)((num + 0.0005) * 1000)) / 1000);
}

- (NSInteger) getSquareValue:(NSInteger) len {
    NSInteger result = 1;
    for (int i = 0; i < len; i++) {
        result *= 10;
    }
    
    return result;
}
// 입력된 자릿수에서 반올림
- (CGFloat) roundNumber:(CGFloat) num length:(NSInteger) len {
    CGFloat roundValue = 5;
    CGFloat result = 0;
    
    result = ((CGFloat)((int)((num + (roundValue / [self getSquareValue:len])) * [self getSquareValue:len - 1]))) / [self getSquareValue:len - 1];
    
    return result;
}

- (CGFloat) roundLimitNumber:(CGFloat) num {
    
    CGFloat value = num;
    NSInteger valueToInt = (int)value;
    NSInteger count = 0;
    CGFloat result = 0;
    
    while (value != valueToInt) {
        
        count++;
        
        value = value * 10;
        valueToInt = (int)value;
    }
    
//    NSLog(@"count : %zd", count);
    
    result = [self roundNumber:num length:count];
    
    return result;
    
}

// 1인치 2.54cm
- (CGFloat) inchToCentimeter:(CGFloat)inch {
    return inch * 2.54;
}

// 1cm 0.393701인치
- (CGFloat) centimeterToInch:(CGFloat)centi {
    return centi * 0.393701;
}

//
- (CGFloat) meterToArea:(CGFloat)meter {
    return meter * 0.3025;
}

- (CGFloat) areaToMeter:(CGFloat)area {
    return area * 3.305785;
}

- (CGFloat) fahrenheitToCelsius:(NSInteger) f {
    return f * -17.222222;
}

- (CGFloat) celsiusToFahrenheit:(NSInteger) c {
    return c * 33.8;
}

- (CGFloat) kiloToMega:(NSInteger) kilo {
    return (CGFloat)kilo / 1024;
}

- (CGFloat) megaToGiga:(NSInteger) mega {
    return (CGFloat)mega / 1024;
}

@end
