//
//  Card.h
//  cardDeck
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

- (void)setType:(NSString *) t number:(NSString *) n color:(NSString *) c;
    
- (NSString *)getCardType;
- (NSString *)getCardNumber;
- (NSString *)getCardColor;

@end
