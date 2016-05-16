//
//  main.m
//  cardDeck
//
//  Created by LEEJIHO on 2016. 5. 12..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dealer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Dealer *dealer = [[Dealer alloc]init];
        [dealer createDeck];
        [dealer shuffleDeck];
        
    }
    return 0;
}
