//
//  ViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "LaunchViewController.h"
#import "SoundController.h"

int astroFall; 

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startNewGame;
@property (weak, nonatomic) IBOutlet UIButton *levelButton;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (nonatomic, strong) NSTimer *astroTimer;
@property (nonatomic, strong) SoundController *soundController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.soundController = [SoundController new];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.startNewGame.hidden = YES;
    self.levelButton.hidden = YES;

    int frame = self.view.frame.size.height;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, - frame);
    
    self.astroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastronautMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
    
}


- (void)fastronautMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - astroFall);
    
    astroFall = astroFall - 5;
    
    if (astroFall < -15) {
        astroFall = -15;
    }
    
    if (self.fastronaut.frame.origin.y >= 470 + self.fastronaut.frame.size.height / 2) {
        astroFall = 0;
        self.startNewGame.hidden = NO;
        self.levelButton.hidden = NO;
        self.fastronaut.image = [UIImage imageNamed:@"greenFastroLanded"];
    }
    
}

- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"The Curtain Rises" withExtension:@"mp3"];
    
    [self.soundController playFileAtURL:url];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
