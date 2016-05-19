//
//  main.m
//  cardDeck
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dealer.h"
#import "Card.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Dealer *dealer = [[Dealer alloc]init];
        [dealer createDeck];
        [dealer shuffleDeck];
        
        
        NSLog(@"=====One Card=====");
        Card *card = [[Card alloc] init];
        card = [dealer getOneCard];
        
        NSLog(@"card : %@, %@, %@",[card type], [card number], [card color]);
        
        
    }
    return 0;
}
