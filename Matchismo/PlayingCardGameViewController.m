//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 01.12.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "CardGamePlayingCardDeck.h"
#import "CardGameViewController.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (CardGameDeck *)createDeck
{
    return [[CardGamePlayingCardDeck alloc] init];
}

//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
    // Get the new view controller using
    //[segue CardGameViewController];
    // Pass the selected object to the new view controller.
//}

@end
