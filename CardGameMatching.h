//
//  CardGameMatching.h
//  Matchismo
//
//  Created by in5630 on 17.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGameDeck.h"
#import "CardGameCard.h"

@interface CardGameMatching : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(CardGameDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSUInteger score;


@end
