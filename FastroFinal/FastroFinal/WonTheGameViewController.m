
//
//  WonTheGameViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/17/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "WonTheGameViewController.h"
#import "SoundEffectsController.h"
#import "ViewController.h"

@interface WonTheGameViewController ()

@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@end

@implementation WonTheGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
