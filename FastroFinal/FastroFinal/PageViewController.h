//
//  PageViewController.h
//  FastroFinal
//
//  Created by Ethan Hess on 9/25/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"

@interface PageViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) ViewControllerOne *vcOne;
@property (nonatomic, strong) ViewControllerTwo *vcTwo;
@property (nonatomic, strong) ViewControllerThree *vcThree;

@end
