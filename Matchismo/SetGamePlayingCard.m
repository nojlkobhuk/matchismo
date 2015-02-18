//
//  SetGamePlayingCard.m
//  Matchismo
//
//  Created by in5630 on 02.12.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "SetGamePlayingCard.h"

@implementation SetGamePlayingCard

@synthesize suit = _suit;

- (NSString *)contents
{
    NSLog(@"content suit %@", self.suit);
    NSLog(@"content rank %d", self.rank);
    //NSArray *rankStrings = [SetGamePlayingCard rankStrings];
    //return [rankStrings[self.rank] stringByAppendingString:self.suit];
    return self.suit;
}

+ (NSArray *) validSuits
{
    return @[@"⚫️",@"◼️",@"🔺"];
    //return @[@"♠️",@"♣️",@"♥️"];
    
}

+ (NSArray *) rankStrings
{
    //return @[@"?",@"1",@"2",@"3"];
    //return nil;
    return @[@"?",@"1",@"2",@"3",@"4",@"5"];
}

+ (NSUInteger) maxRank //{ return 1; }
{ return [[self rankStrings] count]-1; }

- (void)setSuit:(NSString *)suit
{
    if ([[SetGamePlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [SetGamePlayingCard maxRank]) {
        rank = rank;
    }
}

@end

