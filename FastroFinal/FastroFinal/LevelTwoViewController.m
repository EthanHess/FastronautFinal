//
//  LevelTwoViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/23/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelTwoViewController.h"
#import "SoundController.h"

extern int obstaclePosition;
extern int fastroFlight;
extern int coinPosition;
extern int score;

@interface LevelTwoViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *obstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *coin;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;

@end

@implementation LevelTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    score = 0;
    
    [[SoundController sharedInstance]cancelAudio];
    
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacle];
    
    [self placeCoin]; 
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.0038 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
    
}


- (void)obstacleMoving {
    
    //    int value = arc4random_uniform(-1) + 2;
    
//    float value = 0.5;
    
    self.obstacleView.center = CGPointMake(self.obstacleView.center.x - 1, self.obstacleView.center.y);

    
//    self.obstacleView.center = CGPointMake(self.obstacleView.center.x - 1, self.obstacleView.center.y);
    
    if (self.obstacleView.center.x < - 35) {
        
        [self placeObstacle];
    }
    
//    if (self.obstacleView.center.x == 30) {
//        
//        [self scoreChange];
//    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.obstacleView.frame)) {
        
        [self gameOver];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameOver];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameOver];
    }
    
    
}


- (void)placeObstacle {
    
    int frame = self.view.frame.size.height;
    
    obstaclePosition = arc4random() %frame;
    
    self.obstacleView.center = CGPointMake(450, obstaclePosition);
    
    
}




- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 5;
    
    if (fastroFlight < -15) {
        fastroFlight = -15;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"FastronautLanded"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"Fastronaut-Final"];
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    fastroFlight = 30;
    
}

- (void)placeCoin {
    
    int frame = self.view.frame.size.height;
    
    coinPosition = arc4random() %frame;
    
    self.coin.center = CGPointMake(380, coinPosition);
    
    self.coin.hidden = NO;
    
    
}

- (void)coinMoving {
    
    self.coin.center = CGPointMake(self.coin.center.x - 1, self.coin.center.y);
    
    if (self.coin.center.x < - 35) {
        
        [self placeCoin];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.coin.frame)) {
        
        self.coin.hidden = YES;
        [self placeCoin];
        [self scoreChange];
    }
    
}


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    [self.coinTimer invalidate]; 
    
    self.youDiedButton.hidden = NO;
    self.obstacleView.hidden = YES;
    self.fastronaut.hidden = YES;
    self.coin.hidden = YES; 
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    if (score == 10) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate]; 
        
        self.proceedButton.hidden = NO;
        self.obstacleView.hidden = YES;
        self.coin.hidden = YES;
        self.fastronaut.hidden = YES;
        
        self.isComplete = YES;
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    
    self.beginButton.hidden = NO;
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.obstacleView.hidden = NO;
    self.coin.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}



- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"The Complex" withExtension:@"mp3"];
    
    [[SoundController sharedInstance]playFileAtURL:url]; 
    
}


@end
