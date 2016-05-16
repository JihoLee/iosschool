//
//  ToolBox.h
//  TestScore
//
//  Created by LEEJIHO on 2016. 5. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBox : NSObject

- (CGFloat) addFirstNum:(CGFloat)first secondNum:(CGFloat)second;
- (CGFloat) subFirstNum:(CGFloat)first secondNum:(CGFloat)second;
- (CGFloat) multiFirstNum:(CGFloat)first secondNum:(CGFloat)second;
- (CGFloat) devideFirstNum:(CGFloat)first secondNum:(CGFloat)second;

- (CGFloat) inchToCentimeter:(CGFloat)inch;
- (CGFloat) centimeterToInch:(CGFloat)centi;
- (CGFloat) meterToArea:(CGFloat)meter;
- (CGFloat) areaToMeter:(CGFloat)area;
- (CGFloat) fahrenheitToCelsius:(NSInteger)f;
- (CGFloat) celsiusToFahrenheit:(NSInteger)c;
- (CGFloat) kiloToMega:(NSInteger)kilo;
- (CGFloat) megaToGiga:(NSInteger)mega;

- (CGFloat) roundNumber:(CGFloat) num length:(NSInteger) len;
- (CGFloat) roundLimitNumber:(CGFloat) num;
@end
