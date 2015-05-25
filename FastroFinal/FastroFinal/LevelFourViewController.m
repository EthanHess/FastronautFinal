//
//  LevelFourViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/24/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelFourViewController.h"
#import "SoundController.h"
#import <math.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

extern int obstaclePosition;
extern int fastroFlight;
extern int score;

@interface LevelFourViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *leftObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *rightObstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) SoundController *soundController;

@end

@implementation LevelFourViewController

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
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.006 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
}


- (void)obstacleMoving {
    
    self.leftObstacleView.center = CGPointMake(self.leftObstacleView.center.x + 1, self.leftObstacleView.center.y);
    
    self.rightObstacleView.center = CGPointMake(self.rightObstacleView.center.x - 1, self.rightObstacleView.center.y);
    //    [self animateView:self.obstacleView duration:10];
    
    if (self.leftObstacleView.center.x > 400) {
        
        [self placeObstacles];
    }
    
    if (self.leftObstacleView.center.x == 380) {
        
        [self score];
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
    
    obstaclePosition = arc4random() %frame;
    
    self.leftObstacleView.center = CGPointMake(-30, obstaclePosition);
    
    self.rightObstacleView.center = CGPointMake(380, obstaclePosition);
    
    [self animateView:self.leftObstacleView duration:HUGE_VALF];
    
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


- (void)score {
    
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

- (void)animateView:(UIView *)view duration:(float)duration {
    
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(radians(180));
    //    CGAffineTransform bigger = CGAffineTransformMakeScale(2, 2);
    //    CGAffineTransform smaller = CGAffineTransformMakeScale(1, 1);
    
    [UIView animateWithDuration:duration animations:^{
        
        view.transform = rotate;
        //        view.transform = bigger;
        //        view.transform = smaller;
        
    }];
    
}



- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"startSomethingNew" withExtension:@"mp3"];
    
    [self.soundController playFileAtURL:url];
    
}


@end
