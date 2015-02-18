//
//  CardGamePlayingCard.h
//  Matchismo
//
//  Created by in5630 on 05.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGameCard.h"

@interface CardGamePlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end

