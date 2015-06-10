//
//  LevelSevenViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelSevenViewController.h"
#import "SoundController.h"
#import <math.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

extern int topObstaclePosition;
extern int bottomObstaclePosition;
extern int fastroFlight;
extern int coinPosition;
extern int score;

@interface LevelSevenViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIImageView *spinObstacle;

@property (weak, nonatomic) IBOutlet UIImageView *topObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *coin;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;


@end

@implementation LevelSevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    score = 0;
    
    [[SoundController sharedInstance] cancelAudio];
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    [self animateView:self.spinObstacle duration:HUGE_VALF];
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacles];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.0065 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
    
}


- (void)obstacleMoving {
    
    self.topObstacleView.center = CGPointMake(self.topObstacleView.center.x - 1, self.topObstacleView.center.y);
    
    self.bottomObstacleView.center = CGPointMake(self.bottomObstacleView.center.x - 1, self.bottomObstacleView.center.y);
    
    if (self.topObstacleView.center.x < - 30) {
        
        [self placeObstacles];
    }
    
    if (self.topObstacleView.center.x == 30) {
        
        [self scoreChange];
    }
    
    
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.topObstacleView.frame)) {
        
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.bottomObstacleView.frame)) {
        
        [self gameOver];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameOver];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameOver];
    }
    
    
}


- (void)placeObstacles {
    
    topObstaclePosition = arc4random() %380;
    topObstaclePosition = topObstaclePosition - 225;
    bottomObstaclePosition = topObstaclePosition + 690;
    
    self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
    self.bottomObstacleView.center = CGPointMake(450, bottomObstaclePosition);
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 8;
    
    if (fastroFlight < -15) {
        fastroFlight = -15;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"redFastroLanded"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"redFastro"];
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
    self.topObstacleView.hidden = YES;
    self.bottomObstacleView.hidden = YES;
    self.coin.hidden = YES;
    self.fastronaut.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    if (score == 10) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.topObstacleView.hidden = YES;
        self.bottomObstacleView.hidden = YES;
        self.coin.hidden = YES;
        self.fastronaut.hidden = YES;
        
        self.isComplete = YES;
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    
    self.beginButton.hidden = NO;
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.topObstacleView.hidden = NO;
    self.bottomObstacleView.hidden = NO;
    self.coin.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}


- (void)animateView:(UIImageView *)view duration:(float)duration {
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(radians(180));
    
    [UIView animateWithDuration:duration animations:^{
        
        view.transform = rotate;
        
    }];
    
}



- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Urban Gauntlet" withExtension:@"mp3"];
    
    [[SoundController sharedInstance] playFileAtURL:url];
    
}

@end
