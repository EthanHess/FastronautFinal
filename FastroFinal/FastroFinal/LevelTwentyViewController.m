//
//  LevelTwentyViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelTwentyViewController.h"
#import "SoundController.h"


extern int topObstaclePosition;
extern int bottomObstaclePosition;
extern int fastroFlight;
extern int score;
extern int coinPosition;

@interface LevelTwentyViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (weak, nonatomic) IBOutlet UIImageView *topObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *coin;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *rock;


@property (weak, nonatomic) IBOutlet UIImageView *topBounce;


@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;

@end

@implementation LevelTwentyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    score = 0;
    
    [[SoundController sharedInstance] cancelAudio];
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacles];
    
    [self placeCoin];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
}


- (void)obstacleMoving {
    
    self.topObstacleView.center = CGPointMake(self.topObstacleView.center.x + 1, self.topObstacleView.center.y);
    
    self.bottomObstacleView.center = CGPointMake(self.bottomObstacleView.center.x - 1, self.bottomObstacleView.center.y);
    
    if (self.topObstacleView.center.x > 400) {
        
        [self placeObstacles];
    }
    
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.topObstacleView.frame)) {
        
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.bottomObstacleView.frame)) {
        
        [self gameOver];
    }
    
    if (self.fastronaut.center.y < 0) {
        
        [self fastroLaunch];
    }
    
//    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
//        [self gameOver];
//    }
    
    
    
    
}


- (void)placeObstacles {
    
    int frame = self.view.frame.size.height;
    
    topObstaclePosition = arc4random() %frame;
    
    bottomObstaclePosition = arc4random() %frame;
    
    self.topObstacleView.center = CGPointMake(-50, topObstaclePosition);
    
    self.bottomObstacleView.center = CGPointMake(450, bottomObstaclePosition);
    
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight + 10;
    
    if (fastroFlight > 20) {
        fastroFlight = 20;
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"greenReverseTwo"];
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"greenReverseOne"];
    }
    
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    fastroFlight = - 30;
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.rock.frame)) {
        
        fastroFlight = 0;
        
        self.rock.image = [UIImage imageNamed:@"levelTwentyRock Broken"];
    }
    
    
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

- (void)fastroLaunch {
    
    fastroFlight = - 150;
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.rock.frame)) {
        
        fastroFlight = 0;
        
        self.rock.image = [UIImage imageNamed:@"levelTwentyRock Broken"];
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
    
    if (score > 5) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.topObstacleView.hidden = YES;
        self.bottomObstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;
        
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
    
    self.rock.image = [UIImage imageNamed:@"levelTwentyRock"];
    
    fastroFlight = - 30;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}





- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Space Fighter Loop" withExtension:@"mp3"];
    
    [[SoundController sharedInstance]playFileAtURL:url];
    
}






@end
