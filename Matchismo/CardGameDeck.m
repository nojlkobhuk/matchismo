//
//  CardGameDeck.m
//  Matchismo
//
//  Created by in5630 on 05.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameDeck.h"

@interface CardGameDeck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation CardGameDeck

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    //NSLog(@"Cards allocated");
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
{
    if (atTop)
    {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
        
}

- (void)addCard:(Card *)card;
{
    [self addCard:card atTop: NO];
    NSLog(@"Card added");
}

- (Card *)drawRandomCard;
{
    Card *randomCard = nil;
    NSLog(@"Cards count %lu", (unsigned long)self.cards.count);
    if ([self.cards count])
    {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
                                         }
    return randomCard;
}

@end
