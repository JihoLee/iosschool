//
//  Dealer.h
//  cardDeck
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Dealer : Card

- (void)createDeck;
- (void)shuffleDeck;

- (Card *)getOneCard;

@end
