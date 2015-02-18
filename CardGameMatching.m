//
//  CardGameMatching.m
//  Matchismo
//
//  Created by in5630 on 17.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameMatching.h"

@interface CardGameMatching()
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@property (nonatomic, readwrite) NSInteger score;
@end

@implementation CardGameMatching

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    //NSLog(@"Cards allocated");
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(CardGameDeck *)deck;
{
    self = [super init]; //super`s designated initializer
    
    if (self) {
        NSLog(@"Init Deck of cards");
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            NSLog(@"Card %@", card);
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOSE = 0;

- (void)chooseCardAtIndexfor3Cards:(NSUInteger)index;
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //match against other chosen card
            BOOL ifsecondCard = NO;
            Card* secondCard = card;
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched && !ifsecondCard) {
                    ifsecondCard = YES;
                    secondCard = otherCard;
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore){
                        
                        //self.score += matchScore * MATCH_BONUS;
                        //otherCard.matched = YES;
                        //card.matched = YES;
                        
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = YES;
                    }
                    //break; //can only choose 2 cards for now
                } else if (otherCard.isChosen && !otherCard.isMatched && ifsecondCard) {
                    NSLog(@"select third card");
                    int matchScore = [secondCard match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        secondCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        secondCard.chosen = NO;
                    }
                    break; //can only choose 2 cards for now
                }
                //NSLog(@"select third card");
                //NSLog(@"third card");
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
    }
}

- (void)chooseCardAtIndexfor2Cards:(NSUInteger)index;
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //match against other chosen card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; //can only choose 2 cards for now
                }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
    }
}


- (Card *)cardAtIndex:(NSUInteger)index;
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

- (BOOL) restartgame;
{
    self.score = 0;
    //for (Card *card in self.cards) {
        //card.chosen = NO;
        //card.matched = NO;
    //}
    return YES;
}

@end
