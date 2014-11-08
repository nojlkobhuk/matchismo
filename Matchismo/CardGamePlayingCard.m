//
//  CardGamePlayingCard.m
//  Matchismo
//
//  Created by in5630 on 05.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGamePlayingCard.h"

@implementation CardGamePlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [CardGamePlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSArray *) rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger *) maxRank
{
    return [[self rankStrings] count]-1;
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[CardGamePlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [CardGamePlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
