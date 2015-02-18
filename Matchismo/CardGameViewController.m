//
//  CardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 04.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardGameMatching.h"


@interface CardGameViewController ()
@property (strong, nonatomic) CardGameMatching* game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *switchButton;
@property (nonatomic) BOOL segmentTouched;
@end

@implementation CardGameViewController

- (CardGameMatching *)game
{
    return nil;
}

- (CardGameDeck *)createDeck
{
    return nil;
}

@synthesize switchButton;

- (IBAction)selectSwitchButton:(UISegmentedControl *)sender
{
    int segmentIndex = [sender selectedSegmentIndex];
    self.segmentTouched = NO;
    NSLog(@"Switch %@", [self.switchButton titleForSegmentAtIndex:segmentIndex]);
    if (segmentIndex) {
        NSLog(@"It`s three card game");
        switchButton = sender;
        self.segmentTouched = YES;
    } else {
        NSLog(@"It`s two card game");
        switchButton = sender;
        self.segmentTouched = YES;
    }
}





@end
