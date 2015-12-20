//
//  InstructionsViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "InstructionsViewController.h"
#import "SoundController.h"

@interface InstructionsViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up VC's and PVC
    
    self.vcOne = [FirstOnboardingVC new];
    self.vcTwo = [SecondOnboardingVC new];
    self.vcThree = [ThirdOnboardingVC new];
    
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    
    [self.pageViewController setViewControllers:@[[self vcOne]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    [[SoundController sharedInstance] cancelAudio];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    if (viewController == self.vcOne) {
        return nil;
    } else if (viewController == self.vcTwo) {
        return self.vcOne;
    } else if (viewController == self.vcThree) {
        return self.vcTwo;
    } else {
        return self.vcTwo;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if (viewController == self.vcOne) {
        return self.vcTwo;
    } else if (viewController == self.vcTwo) {
        return self.vcThree;
    } else {
        return nil;
    }
    
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
