//
//  LevelThreeViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/24/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelThreeViewController.h"
#import "SoundController.h"
#import <math.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

extern int obstaclePosition;
extern int fastroFlight;
extern int score;

@interface LevelThreeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *obstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) SoundController *soundController;

@end

@implementation LevelThreeViewController

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
    
    [self placeObstacle];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.0038 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
}


- (void)obstacleMoving {
    
    self.obstacleView.center = CGPointMake(self.obstacleView.center.x + 1, self.obstacleView.center.y);
    //    [self animateView:self.obstacleView duration:10];
    
    if (self.obstacleView.center.x > 400) {
        
        [self placeObstacle];
    }
    
    if (self.obstacleView.center.x == 380) {
        
        [self scoreChange];
    }
    
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
    
    self.obstacleView.center = CGPointMake(-80, obstaclePosition);
    
    [self animateView:self.obstacleView duration:HUGE_VALF];
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 10;
    
    if (fastroFlight < -20) {
        fastroFlight = -20;
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


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    
    self.youDiedButton.hidden = NO;
    self.obstacleView.hidden = YES;
    self.fastronaut.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    if (score > 5) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.obstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(playAudio) object:nil];
        
        self.isComplete = YES;
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    
    self.beginButton.hidden = NO;
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.obstacleView.hidden = NO;
    
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
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Urban Gauntlet" withExtension:@"mp3"];
    
    [self.soundController playFileAtURL:url];
    
}

@end