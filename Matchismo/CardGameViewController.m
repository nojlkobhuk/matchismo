//
//  CardGameViewController.m
//  Matchismo
//
//  Created by in5630 on 04.11.14.
//  Copyright (c) 2014 zhurbenko inc. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController


- (IBAction)touchCardButton:(UIButton *)sender {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                      forState:UIControlStateNormal];
    [sender setTitle:@""
            forState:UIControlStateNormal];
    
}

@end
