//
//  CreateGameCardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 01.12.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CreateGameCardGameViewController.h"
#import "CardGamePlayingCardDeck.h"
#import "CardGameMatching.h"

@interface CreateGameCardGameViewController ()
@property (strong, nonatomic) CardGameMatching* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *switchButton;
@property (nonatomic) BOOL segmentTouched;
@end

@implementation CreateGameCardGameViewController

- (CardGameDeck *)createDeck
{
    return [[CardGamePlayingCardDeck alloc] init];
}

- (CardGameMatching *)game
{
    if (!_game) _game = [[CardGameMatching alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int segmentIndex = [_switchButton selectedSegmentIndex];
    [_switchButton setEnabled:YES];
    NSLog(@"Segment touched %hhd", self.segmentTouched);
    NSLog(@"Segment index %d", segmentIndex);
    if (self.segmentTouched) {
        if (segmentIndex) {
            int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
            [self.game chooseCardAtIndexfor3Cards:chosenButtonIndex];
            [self updateUI];
        } else {
            int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
            [self.game chooseCardAtIndexfor2Cards:chosenButtonIndex];
            [self updateUI];
        }
    } else {
        NSLog(@"Segment setEnabled NO");
        for (int index=0; index<_switchButton.numberOfSegments; index++)
        {
            [_switchButton setEnabled:NO forSegmentAtIndex:index];
        }
        int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
        [self.game chooseCardAtIndexfor2Cards:chosenButtonIndex];
        [self updateUI];
    }
    NSLog(@"Segment isEnabled %hhd", _switchButton.isEnabled);
}

- (IBAction)touchRestartButton:(UIButton *)sender
{
    if ([self.game restartgame]) {
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.game = [[CardGameMatching alloc] initWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]];
        [self updateUI];
        self.segmentTouched = NO;
        NSLog(@"Segment setEnabled YES");
        for (int index=0; index<self.switchButton.numberOfSegments; index++)
        {
            [self.switchButton setEnabled:YES forSegmentAtIndex:index];
        }
    }
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        NSLog(@"Card setbuttonindex %d", cardButtonIndex);
        NSLog(@"Card update %@", card);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
