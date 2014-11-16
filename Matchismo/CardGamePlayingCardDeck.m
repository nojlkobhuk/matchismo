//
//  CardGamePlayingCardDeck.m
//  Matchismo
//
//  Created by in5630 on 08.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGamePlayingCardDeck.h"
#import "CardGamePlayingCard.h"

@implementation CardGamePlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [CardGamePlayingCard validSuits]) {
            NSLog(@"Max rank %lu", (unsigned long)[CardGamePlayingCard maxRank]);
            for (NSUInteger rank = 1; rank <= [CardGamePlayingCard maxRank]; rank++) {
                CardGamePlayingCard *card = [[CardGamePlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                NSLog(@"%@", card.suit);
                NSLog(@"%d", card.rank);
                [self addCard:card];
            }
        }
    }
        return self;
}

@end
