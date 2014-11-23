//
//  CardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 04.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardGamePlayingCardDeck.h"
#import "CardGameMatching.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardGameMatching* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *switchButton;
@end

@implementation CardGameViewController

- (CardGameMatching *)game
{
    if (!_game) _game = [[CardGameMatching alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (CardGameDeck *)createDeck
{
    return [[CardGamePlayingCardDeck alloc] init];
}


- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init]; //super`s designated initializer
    
    if (self) {
    NSLog(@"items %@", items[1]);
    }
    return self;
}

- (IBAction)selectSwitchButton:(UISegmentedControl *)sender
{
    int segmentIndex = [sender selectedSegmentIndex];
    NSLog(@"Switch %@", [self.switchButton titleForSegmentAtIndex:segmentIndex]);
    if (segmentIndex) {
        NSLog(@"It`s three card game");
        self.switchButton = sender;
    } else {
        NSLog(@"It`s two card game");
        self.switchButton = sender;
    }
}

- (IBAction)touchRestartButton:(UIButton *)sender
{
    if ([self.game restartgame]) {
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.game = [[CardGameMatching alloc] initWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]];
        [self updateUI];
    }
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int segmentIndex = [self.switchButton selectedSegmentIndex];
    if (segmentIndex) {
        int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
        [self.game chooseCardAtIndexfor3Cards:chosenButtonIndex];
        [self updateUI];
    } else {
        int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
        [self.game chooseCardAtIndexfor2Cards:chosenButtonIndex];
        [self updateUI];
    }
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                   forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
         
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
