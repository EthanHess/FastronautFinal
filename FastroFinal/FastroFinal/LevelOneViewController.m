//
//  LevelOneViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelOneViewController.h"

int fastroFlight;

@interface LevelOneViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *obstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;

@property (nonatomic, strong) NSTimer *obstacleTimer;


@end

@implementation LevelOneViewController

- (IBAction)startGame:(id)sender {
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)resetGame:(id)sender {
    
    
}








@end
