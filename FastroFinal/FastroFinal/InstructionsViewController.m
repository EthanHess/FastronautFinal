//
//  InstructionsViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;

@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.instructionsLabel.text = @"Welcome to Fastronaut! The objective of the game is to collect all of the coins in each  level while dodging the obstacles. Tap on the screen to make Fastronaut move up, otherwise he will fall. Certain levels he will fall slower and others faster and a few he'll fall upside down. The levels get pretty tricky but I assure you they are all possible so stick with it and good luck!";
    
    self.instructionsLabel.numberOfLines = 0;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
