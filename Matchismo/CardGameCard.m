//
//  CardGameCard.m
//  Matchismo
//
//  Created by in5630 on 05.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameCard.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards;
{
    score = 0;
    
    for (Card *card in otherCards) {
        if ([Card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
