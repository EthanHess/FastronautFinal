//
//  SecondOnboardingVC.m
//  FastroFinal
//
//  Created by Ethan Hess on 9/30/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SecondOnboardingVC.h"

@interface SecondOnboardingVC ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SecondOnboardingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:@"secondOnboardImage"];
    
    [self.view addSubview:self.imageView];
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
