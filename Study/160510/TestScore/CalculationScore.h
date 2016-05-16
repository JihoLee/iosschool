//
//  CalculationScore.h
//  TestScore
//
//  Created by LEEJIHO on 2016. 5. 10..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationScore : NSObject

- (void) addSubjectScore:(NSInteger)score;
- (NSInteger)totalScore;
- (CGFloat)averageScore;
- (NSString *)scoreToGrade:(NSInteger)score;
- (CGFloat)gradeToPoint:(NSString *)grade;
@end
