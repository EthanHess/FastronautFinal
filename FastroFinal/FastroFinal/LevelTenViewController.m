//
//  LevelTenViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/29/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelTenViewController.h"
#import "SoundController.h"
#import "SoundEffectsController.h"
#import "ViewController.h"
#import "LevelController.h"
#import "LevelElevenViewController.h"
#import "PurchasedDataController.h"
#import "GamePurchaseController.h"

#define IS_IPHONE_4 ([UIScreen mainScreen].bounds.size.height == 480.0)
#define IS_IPHONE_6 ([UIScreen mainScreen].bounds.size.height == 736.0)

extern int topObstaclePosition;
extern int bottomObstaclePosition;
extern int fastroFlight;
extern int coinPosition;
extern int score;

@interface LevelTenViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIImageView *topObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomObstacleView;
@property (weak, nonatomic) IBOutlet UIImageView *coin;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;

@end

@implementation LevelTenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get 30 coins!" message:nil delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    [alert show];
    
    self.beginButton.backgroundColor = [UIColor whiteColor];
    self.beginButton.layer.cornerRadius = 37.5;
    self.beginButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.beginButton.layer.borderWidth = 3.0;
    
    self.youDiedButton.backgroundColor = [UIColor whiteColor];
    self.youDiedButton.layer.cornerRadius = 37.5;
    self.youDiedButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.youDiedButton.layer.borderWidth = 3.0;
    
    self.proceedButton.backgroundColor = [UIColor whiteColor];
    self.proceedButton.layer.cornerRadius = 37.5;
    self.proceedButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.proceedButton.layer.borderWidth = 3.0;
    
    self.homeButton.backgroundColor = [UIColor whiteColor];
    self.homeButton.layer.cornerRadius = 37.5;
    self.homeButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.homeButton.layer.borderWidth = 3.0;
    
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
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.0075 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.003 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
}

- (void)obstacleMoving {
    
    self.topObstacleView.center = CGPointMake(self.topObstacleView.center.x - 1, self.topObstacleView.center.y);
    
    self.bottomObstacleView.center = CGPointMake(self.bottomObstacleView.center.x + 1, self.bottomObstacleView.center.y);
    
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
        
        topObstaclePosition = arc4random() %350;
        topObstaclePosition = topObstaclePosition - 225;
        bottomObstaclePosition = topObstaclePosition + 600;
        
        self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
        self.bottomObstacleView.center = CGPointMake(-60, bottomObstaclePosition);
        
    }
    
    else if (IS_IPHONE_6) {
        
        topObstaclePosition = arc4random() %400;
        topObstaclePosition = topObstaclePosition - 225;
        bottomObstaclePosition = topObstaclePosition + 800;
        
        self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
        self.bottomObstacleView.center = CGPointMake(-60, bottomObstaclePosition);
        
    }
    
    else {
    
    topObstaclePosition = arc4random() %380;
    topObstaclePosition = topObstaclePosition - 225;
    bottomObstaclePosition = topObstaclePosition + 700;
    
    self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
    self.bottomObstacleView.center = CGPointMake(-60, bottomObstaclePosition);
    
    }
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
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;
        
        [self playWinSound];
        
        if ([LevelController sharedInstance].arrayOfCompletedLevels.count >= 10) {
            
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
    self.coin.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}


- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Ibn Al-Noor" withExtension:@"mp3"];
    
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


- (IBAction)purchaseNextLevels:(id)sender {
    
    if ([PurchasedDataController sharedInstance].accessElevenThroughTwenty || [PurchasedDataController sharedInstance].accessAllLevels) {
        
        LevelElevenViewController *levelEleven = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEleven"];
        
        [self.navigationController pushViewController:levelEleven animated:YES];
    }
    
    else {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"The next ten levels are even cooler!" message:@"Would you like to purchase them for $.99?" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Sure!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [[GamePurchaseController sharedInstance] purchaseOptionSelectedObjectIndex:0]; 
        
        LevelElevenViewController *levelEleven = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEleven"];
        
        [self.navigationController pushViewController:levelEleven animated:YES];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Not now" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    }
}


@end
