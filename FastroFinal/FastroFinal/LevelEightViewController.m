//
//  LevelEightViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/28/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelEightViewController.h"
#import "SoundController.h"
#import "SoundEffectsController.h"
#import "ViewController.h"
#import "LevelController.h"

#define IS_IPHONE_4 ([UIScreen mainScreen].bounds.size.height == 480.0)
#define IS_IPHONE_6 ([UIScreen mainScreen].bounds.size.height == 736.0)

int middleObstaclePosition;
extern int topObstaclePosition;
extern int bottomObstaclePosition;
extern int fastroFlight;
extern int coinPosition;
extern int score;

@interface LevelEightViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIImageView *topObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *middleObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *coin;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;

@end

@implementation LevelEightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get 30 coins!" message:nil delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    [alert show];
    
    self.beginButton.backgroundColor = [UIColor blueColor];
    self.beginButton.layer.cornerRadius = 37.5;
    self.beginButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.beginButton.layer.borderWidth = 3.0;
    
    self.youDiedButton.backgroundColor = [UIColor blueColor];
    self.youDiedButton.layer.cornerRadius = 37.5;
    self.youDiedButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.youDiedButton.layer.borderWidth = 3.0;
    
    self.proceedButton.backgroundColor = [UIColor blueColor];
    self.proceedButton.layer.cornerRadius = 37.5;
    self.proceedButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.proceedButton.layer.borderWidth = 3.0;
    
    self.homeButton.backgroundColor = [UIColor blueColor];
    self.homeButton.layer.cornerRadius = 37.5;
    self.homeButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.homeButton.layer.borderWidth = 3.0;
    
    self.middleObstacleView.layer.cornerRadius = self.middleObstacleView.frame.size.height / 2;
    self.middleObstacleView.layer.masksToBounds = YES;
    
    [[SoundController sharedInstance] cancelAudio];
    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    self.homeButton.hidden = YES;
    score = 0;
    
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacles];
    
    [self placeCoin];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.008 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.003 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
    
}


- (void)obstacleMoving {
    
    self.topObstacleView.center = CGPointMake(self.topObstacleView.center.x - 1, self.topObstacleView.center.y);
    
    self.middleObstacleView.center = CGPointMake(self.middleObstacleView.center.x - 1, self.middleObstacleView.center.y);
    
    self.bottomObstacleView.center = CGPointMake(self.bottomObstacleView.center.x - 1, self.bottomObstacleView.center.y);
    
    if (self.topObstacleView.center.x < - 30) {
        
        [self placeObstacles];
    }
    
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.topObstacleView.frame)) {
        
        [self gameOver];
        [self playGameOverSound];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.bottomObstacleView.frame)) {
        
        [self gameOver];
        [self playGameOverSound];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.middleObstacleView.frame)) {
        
        [self gameOver];
        [self playGameOverSound];
    }
    
    if (self.fastronaut.center.y > self.view.frame.size.height - self.fastronaut.frame.size.height / 2) {
        [self gameOver];
        [self playGameOverSound];
    }
    
    if (self.fastronaut.center.y < 0 + self.fastronaut.frame.size.height / 2) {
        [self gameOver];
        [self playGameOverSound];
    }
    
    
}


- (void)placeObstacles {
    
    if (IS_IPHONE_4) {
        
        topObstaclePosition = arc4random() %300;
        topObstaclePosition = topObstaclePosition - 250;
        bottomObstaclePosition = topObstaclePosition + 615;
        middleObstaclePosition = topObstaclePosition + 305;
        
        self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
        self.bottomObstacleView.center = CGPointMake(450, bottomObstaclePosition);
        self.middleObstacleView.center = CGPointMake(450, middleObstaclePosition);
        
    }
    
    else if (IS_IPHONE_6) {
        
        topObstaclePosition = arc4random() %400;
        topObstaclePosition = topObstaclePosition - 250;
        bottomObstaclePosition = topObstaclePosition + 925;
        middleObstaclePosition = topObstaclePosition + 460;
        
        self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
        self.bottomObstacleView.center = CGPointMake(450, bottomObstaclePosition);
        self.middleObstacleView.center = CGPointMake(450, middleObstaclePosition);
    }
    
    else {
    
    topObstaclePosition = arc4random() %380;
    topObstaclePosition = topObstaclePosition - 250;
    bottomObstaclePosition = topObstaclePosition + 775;
    middleObstaclePosition = topObstaclePosition + 385;
    
    self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
    self.bottomObstacleView.center = CGPointMake(450, bottomObstaclePosition);
    self.middleObstacleView.center = CGPointMake(450, middleObstaclePosition);
        
    }
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 5;
    
    if (fastroFlight < -15) {
        fastroFlight = -15;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"Fastrozontal"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"FastrozontalDown"];
    }
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    fastroFlight = 20;
    
}

- (void)placeCoin {
    
    int frame = self.view.frame.size.height;
    
    coinPosition = arc4random() %frame;
    
    self.coin.center = CGPointMake(450, coinPosition);
    
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
        [self playBellSound];
    }
    
}


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    [self.coinTimer invalidate];
    
    self.youDiedButton.hidden = NO;
    self.homeButton.hidden = NO;
    self.topObstacleView.hidden = YES;
    self.bottomObstacleView.hidden = YES;
    self.middleObstacleView.hidden = YES;
    self.coin.hidden = YES;
    self.fastronaut.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    if (score == 30) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.homeButton.hidden = NO;
        self.topObstacleView.hidden = YES;
        self.bottomObstacleView.hidden = YES;
        self.middleObstacleView.hidden = YES;
        self.coin.hidden = YES;
        self.fastronaut.hidden = YES;

        [self playWinSound];
        
        if ([LevelController sharedInstance].arrayOfCompletedLevels.count >= 8) {
            
            return;
        }
        
        else {
            
            self.isComplete = YES;
            
            [[LevelController sharedInstance]saveBool:self.isComplete];
            
        }
    }
    
    
}


- (IBAction)resetGame:(id)sender {
    
    score = 0;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    self.beginButton.hidden = NO;
    self.homeButton.hidden = YES; 
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.topObstacleView.hidden = NO;
    self.bottomObstacleView.hidden = NO;
    self.middleObstacleView.hidden = NO;
    self.coin.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}


- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Your Call" withExtension:@"mp3"];
    
    [[SoundController sharedInstance]playFileAtURL:url];
    
}

- (void)playBellSound {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ceramicBell" withExtension:@"wav"];
    
    [[SoundEffectsController sharedInstance]playFileAtURL:url];
    
}

- (void)playGameOverSound {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"gameOver" withExtension:@"wav"];
    
    [[SoundEffectsController sharedInstance]playFileAtURL:url];
    
}

- (void)playWinSound {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"winSound" withExtension:@"wav"];
    
    [[SoundEffectsController sharedInstance]playFileAtURL:url];
    
}

- (IBAction)goHome:(id)sender {
    
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    
    [self.navigationController pushViewController:viewController animated:YES];

    
}

@end
