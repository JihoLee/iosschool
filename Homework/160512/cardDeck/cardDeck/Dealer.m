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

typedef NS_ENUM(NSInteger, color) {
    
    CardColorBlack = 0,
    CardColorRed   = 1
    
};

- (void)createDeck {
    
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
                
                colorBool = CardColorBlack;
                
            }
            else {
            
                colorBool = CardColorRed;
     
            }
            // @property 적용
            [card setType:cardType[i]];
            [card setNumber:cardNumber[j]];
            [card setColor:cardColor[colorBool]];
//            [card setType:cardType[i] number:cardNumber[j] color:cardColor[colorBool]];
            [cardDeck addObject:card];
            
        }
        
    }
    cardDeck = [self shuffleDeck:cardDeck];
}

- (NSMutableArray *)shuffleDeck:(NSMutableArray *)list {
    
     NSLog(@"=====Shuffle Deck=====");
    
    NSMutableArray *cardList = list;
    
    for (int i = 0; i < [cardList count] * 2; i++) {
        
        NSInteger randomNumber = arc4random()  % ([cardDeck count]-1);

        
        [cardDeck exchangeObjectAtIndex:randomNumber withObjectAtIndex:randomNumber];

    }
    
    return cardList;
    
}

- (void)printDeck {
    for (Card *c in cardDeck) {
        
        NSLog(@"card : %@, %@, %@",[c type], [c number], [c color]);
    }
}

- (Card *)oneCard {
    
    NSInteger cardNumber = arc4random()  % ([cardDeck count]-1);
    
    Card *cardSubtraction = [cardDeck objectAtIndex:cardNumber];
    
    return cardSubtraction;
}

@end
