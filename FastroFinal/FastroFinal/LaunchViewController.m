//
//  LaunchViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LaunchViewController.h"
#import "SoundController.h"

@interface LaunchViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *rocketView;
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;
@property (nonatomic, strong) NSTimer *rocketTimer;


@end

@implementation LaunchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.proceedButton.hidden = YES;
    
    self.rocketTimer = [NSTimer scheduledTimerWithTimeInterval:0.002 target:self selector:@selector(rocketUp) userInfo:nil repeats:YES];
    
    [[SoundController sharedInstance]cancelAudio];
    
    [self launchSound]; 
    
}

- (void)rocketUp {
    
    
    self.rocketView.center = CGPointMake(self.rocketView.center.x, self.rocketView.center.y - 1);
    
    if (self.rocketView.center.y < 143 + self.rocketView.frame.size.height / 2) {
        self.rocketView.image = [UIImage imageNamed:@"rocketBlastOffFinal"];
    }
    
    if (self.rocketView.center.y < - 500) {
        self.proceedButton.hidden = NO;
        [self.rocketTimer invalidate];
    }
    
}

- (void)launchSound {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Discovery Hit" withExtension:@"mp3"];
    
    [[SoundController sharedInstance]playFileAtURL:url];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
