//
//  LevelFourteenViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//


#import "LevelFourteenViewController.h"
#import "SoundController.h"
#import "SoundEffectsController.h"
#import "ViewController.h"
#import "LevelController.h"

extern int topObstaclePosition;
extern int bottomObstaclePosition;
extern int fastroFlight;
extern int coinPosition; 
extern int score;
extern int diamondPosition;

@interface LevelFourteenViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (weak, nonatomic) IBOutlet UIButton *youDiedButton;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIImageView *topObstacleView;

@property (weak, nonatomic) IBOutlet UIImageView *fastronaut;

@property (weak, nonatomic) IBOutlet UIImageView *mushroomView;

@property (weak, nonatomic) IBOutlet UIImageView *coin;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *greenDiamond;


@property (nonatomic, strong) NSTimer *fastroTimer;
@property (nonatomic, strong) NSTimer *obstacleTimer;
@property (nonatomic, strong) NSTimer *coinTimer;
@property (nonatomic, strong) NSTimer *diamondTimer;

@end

@implementation LevelFourteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get 35 coins!" message:nil delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    [alert show];
    
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
    
    [self placeDiamond];
    
    self.obstacleTimer = [NSTimer scheduledTimerWithTimeInterval:0.008 target:self selector:@selector(obstacleMoving) userInfo:nil repeats:YES];
    
    self.coinTimer = [NSTimer scheduledTimerWithTimeInterval:0.003 target:self selector:@selector(coinMoving) userInfo:nil repeats:YES];
    
    self.diamondTimer = [NSTimer scheduledTimerWithTimeInterval:0.004 target:self selector:@selector(diamondMoving) userInfo:nil repeats:YES];
    
    [self animateView:self.topObstacleView duration:1.5];
    
    [self playAudio];
}


- (void)obstacleMoving {
    
    self.topObstacleView.center = CGPointMake(self.topObstacleView.center.x - 1, self.topObstacleView.center.y);
    
    if (self.topObstacleView.center.x < - 30) {
        
        [self placeObstacles];
    }
    
    
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.topObstacleView.frame)) {
        
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
    
    int frame = self.view.frame.size.height;
    
    topObstaclePosition = arc4random() %frame;
    
    self.topObstacleView.center = CGPointMake(450, topObstaclePosition);
    
}

- (void)diamondMoving {
    
    self.greenDiamond.center = CGPointMake(self.greenDiamond.center.x + 1, self.greenDiamond.center.y);
    
    if (self.greenDiamond.center.x > 450) {
        
        [self placeDiamond];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.greenDiamond.frame)) {
        
        self.greenDiamond.hidden = YES;
        [self placeDiamond];
        [self scoreChangeTwo];
        [self playLoudBellSound];
        
    }
    
}

- (void)placeDiamond {
    
    int frame = self.view.frame.size.height;
    
    diamondPosition = arc4random() %frame;
    
    self.greenDiamond.center = CGPointMake(-50, diamondPosition);
    
    self.greenDiamond.hidden = NO;
    
}


- (void)fastroMoving {
    
    self.fastronaut.center = CGPointMake(self.fastronaut.center.x, self.fastronaut.center.y - fastroFlight);
    
    fastroFlight = fastroFlight - 10;
    
    if (fastroFlight < -20) {
        fastroFlight = -20;
    }
    
    if (fastroFlight > 0) {
        self.fastronaut.image = [UIImage imageNamed:@"Fastrozontal"];
    }
    
    if (fastroFlight < 0) {
        self.fastronaut.image = [UIImage imageNamed:@"FastrozontalDown"];
    }
    
    if (CGRectIntersectsRect(self.fastronaut.frame, self.mushroomView.frame)) {
        
        [self mushroomPop];
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
    [self.diamondTimer invalidate];
    
    self.youDiedButton.hidden = NO;
    self.homeButton.hidden = NO;
    self.topObstacleView.hidden = YES;
    self.coin.hidden = YES;
    self.fastronaut.hidden = YES;
    self.greenDiamond.hidden = YES;
    
    score = 0;
    
}


- (void)scoreChange {
    
    score = score + 1;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    if (score == 35) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        [self.diamondTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.homeButton.hidden = NO;
        self.topObstacleView.hidden = YES;
        self.fastronaut.hidden = YES;
        self.coin.hidden = YES;
        self.greenDiamond.hidden = YES;
        
        [self playWinSound];
        
        if ([LevelController sharedInstance].arrayOfCompletedLevels.count >= 15) {
            
            return;
        }
        
        else {
            
            self.isComplete = YES;
            
            [[LevelController sharedInstance]saveBool:self.isComplete];
            
        }
    }
    
    
}

- (void)scoreChangeTwo {
    
    score = score + 3;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    if (score >= 35) {
        
        [self.fastroTimer invalidate];
        [self.obstacleTimer invalidate];
        [self.coinTimer invalidate];
        [self.diamondTimer invalidate];
        
        self.proceedButton.hidden = NO;
        self.homeButton.hidden = NO;
        self.topObstacleView.hidden = YES;
        self.coin.hidden = YES;
        self.fastronaut.hidden = YES;
        self.greenDiamond.hidden = YES;
        
        if ([LevelController sharedInstance].arrayOfCompletedLevels.count >= 15) {
            
            return;
        }
        
        else {
            
            self.isComplete = YES;
            
            [[LevelController sharedInstance]saveBool:self.isComplete];
            
        }
        
        [self playWinSound];
    }
}

- (void)mushroomPop {
    
    fastroFlight = 80;
    
    self.mushroomView.animationImages = [NSArray arrayWithObjects:
                                       [UIImage imageNamed:@"flatMushroom"],
                                       [UIImage imageNamed:@"levelFourteenMushroom"],
                                       [UIImage imageNamed:@"flatMushroom"], nil];
    
    [self.mushroomView setAnimationRepeatCount:1];
    self.mushroomView.animationDuration = 0.2;
    [self.mushroomView startAnimating];
    
}

- (void)animateView:(UIImageView *)view duration:(float)duration {
    
    
    CGAffineTransform bigger = CGAffineTransformMakeScale(1.3, 1.3);
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        
        view.transform = bigger;
        
    } completion:nil];
    
    
    
}


- (IBAction)resetGame:(id)sender {
    
    score = 0;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    
    self.beginButton.hidden = NO;
    self.homeButton.hidden = YES; 
    self.youDiedButton.hidden = YES;
    self.fastronaut.hidden = NO;
    self.topObstacleView.hidden = NO;
    self.greenDiamond.hidden = NO;
    self.coin.hidden = NO;
    
    self.fastronaut.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
    
}



- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"The Whip Theme" withExtension:@"mp3"];
    
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

- (void)playLoudBellSound {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ding" withExtension:@"wav"];
    
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
