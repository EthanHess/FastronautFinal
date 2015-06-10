//
//  LevelSixteenViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/8/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//


#import "LevelSixteenViewController.h"
#import "SoundController.h"


extern int topObstaclePosition;
extern int bottomObstaclePosition;
extern int fastroFlight;
extern int score;

@interface LevelSixteenViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *topObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomObstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (weak, nonatomic) IBOutlet UIImageView *bounceView;
@property (weak, nonatomic) IBOutlet UIImageView *topBounce;


@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) SoundController *soundController;

@end

@implementation LevelSixteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.soundController = [SoundController new];
    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    score = 0;
    
    [self playAudio];
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacles];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
}


- (void)obstacleMoving {
    
    self.topObstacleView.center = CGPointMake(self.topObstacleView.center.x - 1, self.topObstacleView.center.y);
    
    self.bottomObstacleView.center = CGPointMake(self.bottomObstacleView.center.x + 1, self.bottomObstacleView.center.y);
    
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
    
    int frame = self.view.frame.size.height;
    
    topObstaclePosition = arc4random() %frame;
    
    self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 10;
    
    if (fastroFlight < -20) {
        fastroFlight = -20;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"redFastroLanded"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"redFastro"];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.bounceView.frame)) {
        
        [self mushroomPop];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.topBounce.frame)) {
        
        [self popDown];
    }
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    fastroFlight = 30;
    
}


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    
    self.youDiedButton.hidden = NO;
    self.topObstacleView.hidden = YES;
    self.bottomObstacleView.hidden = YES;
    self.fastronaut.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    if (score > 5) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.topObstacleView.hidden = YES;
        self.bottomObstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
    
        
        self.isComplete = YES;
    }
    
    
}

- (void)mushroomPop {
    
    fastroFlight = 80;
    
    self.bounceView.image = [UIImage imageNamed:@"LevelSixteenBounceDown"];
    
    if (self.fastronaut.center.y < 275) {
        
        self.bounceView.image = [UIImage imageNamed:@"LevelSixteenBounce"];
        fastroFlight = 50;
    }
    
}

- (void)popDown {
    
    fastroFlight = - 80;
    
    self.topBounce.image = [UIImage imageNamed:@"LevelSixteenBounceUp"];
    
    if (self.fastronaut.center.y > 275) {
        
        self.bounceView.image = [UIImage imageNamed:@"LevelSixteenBounce"];
        fastroFlight = 50;
    
    }
}

- (IBAction)resetGame:(id)sender {
    
    self.beginButton.hidden = NO;
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.topObstacleView.hidden = NO;
    self.bottomObstacleView.hidden = NO;
    
    self.bounceView.image = [UIImage imageNamed:@"LevelSixteenBounce"];
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}





- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Space Fighter Loop" withExtension:@"mp3"];
    
    [self.soundController playFileAtURL:url];
    
}






@end
