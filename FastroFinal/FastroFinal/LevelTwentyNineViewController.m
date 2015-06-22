//
//  LevelTwentyNineViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/17/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelTwentyNineViewController.h"
#import "SoundController.h"

extern int obstaclePosition;
extern int fastroFlight;
extern int score;
extern int coinPosition;
extern int redCoinPosition;
int diamondPosition;

@interface LevelTwentyNineViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIImageView *diamondView;
@property (weak, nonatomic) IBOutlet UIImageView *obstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (weak, nonatomic) IBOutlet UIImageView *coin;
@property (weak, nonatomic) IBOutlet UIImageView *redCoin;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;
@property (nonatomic, strong) NSTimer *diamondTimer;

@end

@implementation LevelTwentyNineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get 60 points!" message:nil delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    [alert show];
    
    [[SoundController sharedInstance] cancelAudio];
    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    score = 0;
    
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacle];
    
    [self placeCoin];
    
    [self placeRedCoin];
    
    self.diamondTimer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(diamondMoving) userInfo:nil repeats:YES];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.0075 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.004 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
}


- (void)obstacleMoving {
    
    //    int value = arc4random_uniform(-1) + 2;
    
    //    float value = 0.5;
    
    self.obstacleView.center = CGPointMake(self.obstacleView.center.x - 1, self.obstacleView.center.y);
    
    
    if (self.obstacleView.center.x < - 35) {
        
        [self placeObstacle];
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

- (void)diamondMoving {
    
    self.diamondView.center = CGPointMake(self.diamondView.center.x + 1, self.diamondView.center.y);
    
    if (self.diamondView.center.x > 450) {
        
        [self placeDiamond];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.diamondView.frame)) {
        
        [self placeDiamond];
        [self scoreChangeTwo];
        self.diamondView.hidden = YES;
    }
    
    
}

- (void)placeDiamond {
    
    int frame = self.view.frame.size.height;
    
    diamondPosition = arc4random() %frame;
    self.diamondView.center = CGPointMake(-50, diamondPosition);
    
    self.diamondView.hidden = NO;
    
}


- (void)placeObstacle {
    
    int frame = self.view.frame.size.height;
    
    obstaclePosition = arc4random() %frame;
    
    self.obstacleView.center = CGPointMake(480, obstaclePosition);
    
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 8;
    
    if (fastroFlight < - 20) {
        fastroFlight = - 20;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"greenFastroLanded"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"GreenFastro"];
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    fastroFlight = 30;
    
    
}

- (void)placeCoin {
    
    int frame = self.view.frame.size.height;
    
    coinPosition = arc4random() %frame;
    
    self.coin.center = CGPointMake(-50, coinPosition);
    
    self.coin.hidden = NO;
    
}

- (void)placeRedCoin {
    
    int frame = self.view.frame.size.height;
    
    redCoinPosition = arc4random() %frame;
    
    self.redCoin.center = CGPointMake(400, redCoinPosition);
    
    self.redCoin.hidden = NO;
}


- (void)coinMoving {
    
    self.coin.center = CGPointMake(self.coin.center.x + 1, self.coin.center.y);
    
    if (self.coin.center.x > 450) {
        
        [self placeCoin];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.coin.frame)) {
        
        self.coin.hidden = YES;
        [self placeCoin];
        [self scoreChange];
    }
    
    //animate red coin
    
    self.redCoin.center = CGPointMake(self.redCoin.center.x - 1, self.redCoin.center.y);
    
    if (self.redCoin.center.x < - 50) {
        
        [self placeRedCoin];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.redCoin.frame)) {
        
        self.redCoin.hidden = YES;
        [self placeRedCoin];
        [self scoreDown];
    }
    
}


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    [self.coinTimer invalidate];
    [self.diamondTimer invalidate];
    
    self.youDiedButton.hidden = NO;
    self.obstacleView.hidden = YES;
    self.fastronaut.hidden = YES;
    self.coin.hidden = YES;
    self.redCoin.hidden = YES;
    self.diamondView.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    if (score == 60) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.obstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;
        self.redCoin.hidden = YES;
        self.diamondView.hidden = YES;
        
        self.isComplete = YES;
    }
    
    
}

- (void)scoreDown {
    
    if (score > 0) {
        
        score = score - 1;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
        
    }
    
    else {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        [self.diamondTimer invalidate];
        
        self.youDiedButton.hidden = NO;
        self.obstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;
        self.redCoin.hidden = YES;
        self.diamondView.hidden = YES;
        
    }
    
}

- (void)scoreChangeTwo {
    
    score = score + 5;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    if (score >= 60) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        [self.diamondTimer invalidate]; 
        
        self.proceedButton.hidden = NO;
        self.obstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;
        self.redCoin.hidden = YES;
        self.diamondView.hidden = YES;
        
        self.isComplete = YES;
    }
}


- (IBAction)resetGame:(id)sender {
    
    score = 0;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    self.beginButton.hidden = NO;
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.obstacleView.hidden = NO;
    self.coin.hidden = NO;
    self.redCoin.hidden = NO;
    self.diamondView.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}



- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Your Call" withExtension:@"mp3"];
    
    [[SoundController sharedInstance] playFileAtURL:url];
    
}

- (IBAction)goHome:(id)sender {
    
    
    
}

@end
