//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 01.12.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "CardGameMatching.h"
#import "SetGamePlayingCardDeck.h"

@interface SetCardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *setButtons;
@property (strong, nonatomic) CardGameMatching* game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation SetCardGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CardGameDeck *)createDeck
{
    return [[SetGamePlayingCardDeck alloc] init];
}

- (CardGameMatching *)game
{
    if (!_game) _game = [[CardGameMatching alloc] initWithCardCount:[self.setButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}
- (IBAction)touchSetButton:(UIButton *)sender {
        int chosenButtonIndex = [self.setButtons indexOfObject:sender];
        NSLog(@"Card buttonindex %d", chosenButtonIndex);
        [self.game chooseCardAtIndexfor2Cards:chosenButtonIndex];
        [self updateUI];
        NSLog(@"Card touched");
}

- (void)updateUI
{
    for (UIButton *setButton in self.setButtons) {
        int setButtonIndex = [self.setButtons indexOfObject:setButton];
        Card* card = [self.game cardAtIndex:setButtonIndex];
        NSLog(@"setbuttonindex %d", setButtonIndex);
        NSLog(@"Card %@", card);
        [setButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [setButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        setButton.enabled = !card.isMatched;
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
