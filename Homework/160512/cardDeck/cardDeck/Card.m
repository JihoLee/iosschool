//
//  Card.m
//  cardDeck
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)init
{
    self = [super init];
    if (self) {
        /*
         카드 타입, 숫자, 색상 정보
         */
        NSArray *cardType = @[@"Space", @"Diamond", @"Clover", @"Heart"];
        NSArray *cardNumber = @[@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A"];
        NSArray *cardColor = @[@"Black", @"Red"];
    }
    return self;
}

@end
