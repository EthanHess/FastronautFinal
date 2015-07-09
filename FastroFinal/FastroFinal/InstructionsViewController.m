//
//  InstructionsViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "InstructionsViewController.h"
#import "SoundController.h"

@interface InstructionsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;

@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[SoundController sharedInstance] cancelAudio];
    
    self.instructionsLabel.text = @"Welcome to Fastronaut! The objective of the game is to collect all of the coins in each level while dodging the obstacles. Tap on the screen to make Fastronaut move up, otherwise he will fall. Certain levels he will fall slower and others faster and a few he'll fall upside down. Make sure he doesn't touch the obstacles or top of the screen because he will die. If he does die don't worry, his lives are infinite so you can try as many times as you want! After pressing the 'Okay!' button which tells you how many coins or points to get, click the begin button when you're ready to start the game. The levels get pretty tricky but I assure you they are all possible so stick with it and good luck!";
    
    self.instructionsLabel.numberOfLines = 0;
    self.instructionsLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"InstructionsBackground"]];
    
    
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
