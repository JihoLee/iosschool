//
//  Dealer.m
//  cardDeck
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "Dealer.h"

@implementation Dealer {
    
    NSMutableArray *cardDeck;
    
    Card *card;
}

- (void)createDeck {
    
    NSLog(@"=====Create Deck=====");
    
    cardDeck = [[NSMutableArray alloc] initWithCapacity:1];
        BOOL colorBool = 0;
    
    /*
     카드 타입, 숫자, 색상 정보
     */
    NSArray *cardType = @[@"Space", @"Diamond", @"Clover", @"Heart"];
    NSArray *cardNumber = @[@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A"];
    NSArray *cardColor = @[@"Black", @"Red"];
    
    for (int i = 0; i < cardType.count; i++) {
        for (int j = 0; j < cardNumber.count; j++) {
            
            card = [[Card alloc]init];

            if ([cardType[i] isEqualToString:@"Space"] || [cardType[i] isEqualToString:@"Clover"]) {
                
                colorBool = 1;
                
            }
            else {
            
                colorBool = 0;
     
            }
            // @property 적용
            [card setType:cardType[i]];
            [card setNumber:cardNumber[j]];
            [card setColor:cardColor[colorBool]];
//            [card setType:cardType[i] number:cardNumber[j] color:cardColor[colorBool]];
            [cardDeck addObject:card];
            
        }
        
    }

    [self printDeck];
}

- (void)shuffleDeck {
    
     NSLog(@"=====Shuffle Deck=====");
    
    for (int i = 0; i < [cardDeck count] * 2; i++) {
        
        NSInteger ranFirst = arc4random()  % ([cardDeck count]-1);
        NSInteger ranSecond = arc4random()  % ([cardDeck count]-1);
        
        [cardDeck exchangeObjectAtIndex:ranFirst withObjectAtIndex:ranSecond];

    }
    
    [self printDeck];
    
}

- (void)printDeck {
    for (Card *c in cardDeck) {
        
        NSLog(@"card : %@, %@, %@",[c type], [c number], [c color]);
    }
}

- (Card *)getOneCard {
    
    NSInteger cardNumber = arc4random()  % ([cardDeck count]-1);
    
    Card *cardSub = [cardDeck objectAtIndex:cardNumber];
    
    return cardSub;
}

@end
