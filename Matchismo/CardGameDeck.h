//
//  CardGameDeck.h
//  Matchismo
//
//  Created by in5630 on 05.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGameCard.h"

@interface CardGameDeck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end
