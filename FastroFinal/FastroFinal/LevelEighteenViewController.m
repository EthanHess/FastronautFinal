//
//  LevelNineteenViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/9/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelEighteenViewController.h"
#import "SoundController.h"
#import "SoundEffectsController.h"
#import "ViewController.h"
#import "LevelController.h"

#define IS_IPHONE_4 ([UIScreen mainScreen].bounds.size.height == 480.0)
#define IS_IPHONE_6 ([UIScreen mainScreen].bounds.size.height == 736.0)

extern int obstaclePosition;
extern int fastroFlight;
extern int score;
extern int coinPosition;

@interface LevelEighteenViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIImageView *obstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;
@property (weak, nonatomic) IBOutlet UIImageView *coin;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;

@end

@implementation LevelEighteenViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (IS_IPHONE_6) {
//        
//        self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
//        
//        [[SoundController sharedInstance] cancelAudio];
//        
//        
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get 20 coins!" message:nil delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
//        [alert show];
//        
//        self.beginButton.backgroundColor = [UIColor blueColor];
//        self.beginButton.layer.cornerRadius = 37.5;
//        self.beginButton.layer.borderColor = [[UIColor whiteColor]CGColor];
//        self.beginButton.layer.borderWidth = 3.0;
//        
//        self.youDiedButton.backgroundColor = [UIColor blueColor];
//        self.youDiedButton.layer.cornerRadius = 37.5;
//        self.youDiedButton.layer.borderColor = [[UIColor whiteColor]CGColor];
//        self.youDiedButton.layer.borderWidth = 3.0;
//        
//        self.proceedButton.backgroundColor = [UIColor blueColor];
//        self.proceedButton.layer.cornerRadius = 37.5;
//        self.proceedButton.layer.borderColor = [[UIColor whiteColor]CGColor];
//        self.proceedButton.layer.borderWidth = 3.0;
//        
//        self.homeButton.backgroundColor = [UIColor blueColor];
//        self.homeButton.layer.cornerRadius = 37.5;
//        self.homeButton.layer.borderColor = [[UIColor whiteColor]CGColor];
//        self.homeButton.layer.borderWidth = 3.0;
//        
//        self.obstacleView.layer.cornerRadius = self.obstacleView.frame.size.height / 2;
//        self.obstacleView.layer.masksToBounds = YES;
//        
//        self.proceedButton.hidden = YES;
//        self.youDiedButton.hidden = YES;
//        self.homeButton.hidden = YES;
//        score = 0;
//        
//    }
//    
//    else {
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
    [[SoundController sharedInstance] cancelAudio];
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get 35 coins!" message:nil delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
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
    
    self.obstacleView.layer.cornerRadius = self.obstacleView.frame.size.height / 2;
    self.obstacleView.layer.masksToBounds = YES; 
    
    self.proceedButton.hidden = YES;
    self.youDiedButton.hidden = YES;
    self.homeButton.hidden = YES;
    score = 0;
    
//    }
    
}


- (IBAction)startGame:(id)sender {
    
    self.beginButton.hidden = YES;
    
    self.fastroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastroMoving) userInfo:nil repeats:YES];
    
    [self placeObstacle];
    
    [self placeCoin];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.0085 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.003 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    [self playAudio];
}


- (void)obstacleMoving {
    
    
    self.obstacleView.center = CGPointMake(self.obstacleView.center.x - 1, self.obstacleView.center.y);
    
    
    if (self.obstacleView.center.x < - 35) {
        
        [self placeObstacle];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.obstacleView.frame)) {
        
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


- (void)placeObstacle {
    
    int frame = self.view.frame.size.height;
    
    obstaclePosition = arc4random() %frame;
    
    self.obstacleView.center = CGPointMake(530, obstaclePosition);
    
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 5;
    
    if (fastroFlight < - 15) {
        fastroFlight = - 15;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"Fastrozontal"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"FastrozontalDown"];
    }
    

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (IS_IPHONE_4) {
        
        fastroFlight = 25;
    }
    
    else {
        
        fastroFlight = 30;
    }
    
    

    
}

- (void)placeCoin {
    
    int frame = self.view.frame.size.height;
    
    coinPosition = arc4random() %frame;
    
    self.coin.center = CGPointMake(-50, coinPosition);
    
    self.coin.hidden = NO;
    
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
        [self playBellSound];
    }
    
}


- (void)gameOver {
    
    [self.fastroTimer invalidate];
    [self.obstacleTimer invalidate];
    [self.coinTimer invalidate];
    
    self.homeButton.hidden = NO;
    self.youDiedButton.hidden = NO;
    self.obstacleView.hidden = YES;
    self.fastronaut.hidden = YES;
    self.coin.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
//    if (IS_IPHONE_6) {
//        
//        score = score + 1;
//        
//        self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
//        
//        if (score == 20) {
//            
//            [self.fastroTimer invalidate];
//            [self.obstacleTimer invalidate];
//            [self.coinTimer invalidate];
//            
//            self.homeButton.hidden = NO;
//            self.proceedButton.hidden = NO;
//            self.obstacleView.hidden = YES;
//            self.fastronaut.hidden = YES;
//            self.coin.hidden = YES;
//            
//            [self playWinSound];
//            
//            if ([LevelController sharedInstance].arrayOfCompletedLevels.count >= 18) {
//                
//                return;
//            }
//            
//            else {
//                
//                self.isComplete = YES;
//                
//                [[LevelController sharedInstance]saveBool:self.isComplete];
//                
//            }
//        }
//        
//    }
//    
//    else {
    
    score = score + 1;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    if (score == 35) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        
        self.homeButton.hidden = NO;
        self.proceedButton.hidden = NO;
        self.obstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;

        [self playWinSound];
        
        if ([LevelController sharedInstance].arrayOfCompletedLevels.count >= 18) {
            
            return;
        }
        
        else {
            
            self.isComplete = YES;
            
            [[LevelController sharedInstance]saveBool:self.isComplete];
            
        }
    }
        
}
    
//}


- (IBAction)resetGame:(id)sender {
    
    score = 0;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    self.beginButton.hidden = NO;
    self.homeButton.hidden = YES; 
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.obstacleView.hidden = NO;
    self.coin.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}



- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Shiny Tech2" withExtension:@"mp3"];
    
    [[SoundController sharedInstance] playFileAtURL:url];
    
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
