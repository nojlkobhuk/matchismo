//
//  SetGamePlayingCardDeck.m
//  Matchismo
//
//  Created by in5630 on 02.12.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "SetGamePlayingCardDeck.h"
#import "SetGamePlayingCard.h"

@implementation SetGamePlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [SetGamePlayingCard validSuits]) {
            NSLog(@"Max rank %lu", (unsigned long)[SetGamePlayingCard maxRank]);
            for (NSUInteger rank = 1; rank <= [SetGamePlayingCard maxRank]; rank++) {
                SetGamePlayingCard *card = [[SetGamePlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                NSLog(@"suit %@", card.suit);
                NSLog(@"rank %d", card.rank);
                NSLog(@"Tried set init");
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
