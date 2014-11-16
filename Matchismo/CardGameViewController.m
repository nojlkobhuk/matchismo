//
//  CardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 04.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardGamePlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardGameDeck* deck;
@end

@implementation CardGameViewController

- (CardGameDeck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (CardGameDeck *)createDeck
{
    return [[CardGamePlayingCardDeck alloc] init];
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@""
                forState:UIControlStateNormal];
    } else {
        Card *randomCard = [self.deck drawRandomCard];
        NSLog(@"Random card %@", randomCard.contents);
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents
                    forState:UIControlStateNormal];
        }
    }
    self.flipCount++;
}

@end
