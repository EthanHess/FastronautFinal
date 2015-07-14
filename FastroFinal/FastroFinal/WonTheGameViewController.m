
//
//  WonTheGameViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/17/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "WonTheGameViewController.h"
#import "SoundController.h"
#import "ViewController.h"

extern int astroFall;

@interface WonTheGameViewController ()

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIImageView *fastro;
@property (weak, nonatomic) IBOutlet UIImageView *trophy;
@property (nonatomic, strong) NSTimer *astroTimer;

@end

@implementation WonTheGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeButton.layer.backgroundColor = [[UIColor blueColor]CGColor];
    self.homeButton.layer.cornerRadius = 37.5;
    self.homeButton.layer.borderColor = [[UIColor yellowColor]CGColor];
    self.homeButton.layer.borderWidth = 3.0;
    self.homeButton.hidden = YES;
    
    [self placeFastro];
    [self playAudio]; 
}

- (void)placeFastro {
    
    int frame = self.view.frame.size.height;
    
    self.fastro.center = CGPointMake(self.view.frame.size.width / 2, - frame);
    
    self.astroTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fastronautMoving) userInfo:nil repeats:YES];
}

- (void)fastronautMoving {
    
    self.fastro.center = CGPointMake(self.fastro.center.x, self.fastro.center.y - astroFall);
    
    astroFall = astroFall - 10;
    
    if (astroFall < -15) {
        astroFall = -15;
    }
    
    if (CGRectIntersectsRect(self.fastro.frame, self.trophy.frame)) {
        
        [self.astroTimer invalidate]; 
        
        self.fastro.image = [UIImage imageNamed:@"greenFastroLanded"];
        astroFall = 0;
        
        self.homeButton.hidden = NO; 
    }
    
}

- (void)playAudio {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Call to Adventure" withExtension:@"mp3"];
    
    [[SoundController sharedInstance]playFileAtURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goHome:(id)sender {
    
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    
    [self.navigationController pushViewController:viewController animated:YES];

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
