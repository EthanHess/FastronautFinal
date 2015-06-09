//
//  LevelFiveViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/25/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelFiveViewController.h"
#import "SoundController.h"


extern int leftObstaclePosition;
extern int rightObstaclePosition;
extern int fastroFlight;
extern int score;

@interface LevelFiveViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *leftObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *rightObstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;

@end

@implementation LevelFiveViewController

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
    
    [self placeObstacles];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.007 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    [self playAudio]; 
}


- (void)obstacleMoving {
    
    self.leftObstacleView.center = CGPointMake(self.leftObstacleView.center.x + 1, self.leftObstacleView.center.y);
    
    self.rightObstacleView.center = CGPointMake(self.rightObstacleView.center.x - 1, self.rightObstacleView.center.y);
    
    if (self.leftObstacleView.center.x > 400) {
        
        [self placeObstacles];
    }
    
    if (self.leftObstacleView.center.x == 380) {
        
        [self scoreChange];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.leftObstacleView.frame)) {
        
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.rightObstacleView.frame)) {
        
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
    
    leftObstaclePosition = arc4random() %frame;
    
    self.leftObstacleView.center = CGPointMake(-90, leftObstaclePosition);
    
    rightObstaclePosition = arc4random() %frame;
    
    self.rightObstacleView.center = CGPointMake(440, rightObstaclePosition);
    
    
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


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    
    self.youDiedButton.hidden = NO;
    self.leftObstacleView.hidden = YES;
    self.rightObstacleView.hidden = YES;
    self.fastronaut.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    if (score > 5) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.leftObstacleView.hidden = YES;
        self.rightObstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(playAudio) object:nil];
        
        self.isComplete = YES;
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    
    self.beginButton.hidden = NO;
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.leftObstacleView.hidden = NO;
    self.rightObstacleView.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}





- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Zanzibar" withExtension:@"mp3"];
    
    [[SoundController sharedInstance]playFileAtURL:url];
    
}






@end
