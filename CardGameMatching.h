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

- (void)chooseCardAtIndexfor3Cards:(NSUInteger)index;
- (void)chooseCardAtIndexfor2Cards:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (BOOL) restartgame;
@property (nonatomic, readonly) NSInteger score;

@end
