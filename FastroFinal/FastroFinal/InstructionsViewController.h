//
//  InstructionsViewController.h
//  FastroFinal
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "FirstOnboardingVC.h"
#import "SecondOnboardingVC.h"
#import "ThirdOnboardingVC.h"

@interface InstructionsViewController : ViewController

@property (nonatomic, strong) FirstOnboardingVC *vcOne;
@property (nonatomic, strong) SecondOnboardingVC *vcTwo;
@property (nonatomic, strong) ThirdOnboardingVC *vcThree;

@end
