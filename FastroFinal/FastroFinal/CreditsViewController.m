//
//  CreditsViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CreditsViewController.h"
#import "SoundController.h"

@interface CreditsViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *creditsLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *creditsLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *songCreditsLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *songCreditsLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *songCreditsLabelThree;

@end

@implementation CreditsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[SoundController sharedInstance]cancelAudio];
    
    self.creditsLabelOne.text = @"Game and animations by Ethan Hess";
    
    self.creditsLabelTwo.text = @"Music by Kevin MacLeod";
    
    self.songCreditsLabelOne.text = @"'One Sly Move' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http:'//creativecommons.org/licenses/by/3.0/";
    self.songCreditsLabelOne.numberOfLines = 0;
    
    self.songCreditsLabelTwo.text = @"'Unwritten Return' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http:'//creativecommons.org/licenses/by/3.0/";
    self.songCreditsLabelTwo.numberOfLines = 0;
    
    self.songCreditsLabelThree.text = @"'Your Call' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http:'//creativecommons.org/licenses/by/3.0/";
    self.songCreditsLabelThree.numberOfLines = 0;
    
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
