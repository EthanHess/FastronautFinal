//
//  LevelsListController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/17/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelsListController.h"
#import "ViewController.h"
#import "LevelOneViewController.h"
#import "LevelTwoViewController.h"
#import "LevelThreeViewController.h"
#import "LevelFourViewController.h"
#import "LevelFiveViewController.h"
#import "LevelSixViewController.h"
#import "LevelSevenViewController.h"
#import "LevelEightViewController.h"
#import "LevelNineViewController.h"
#import "LevelTenViewController.h"
#import "LevelElevenViewController.h"
#import "LevelTwelveViewController.h"
#import "LevelThirteenViewController.h"
#import "LevelFourteenViewController.h"
#import "LevelFifteenViewController.h"
#import "LevelSixteenViewController.h"

@interface LevelsListController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LevelsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor blackColor];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self levels].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.textColor = [UIColor greenColor];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:24];
    cell.textLabel.text = [self levels][indexPath.row];
    cell.backgroundColor = [UIColor blackColor];
    
    return cell;
    
}

- (NSArray *)levels {
    
    return @[@"Home Screen", @"Level One", @"Level Two", @"Level Three", @"Level Four", @"Level Five", @"Level Six", @"Level Seven", @"Level Eight", @"Level Nine", @"Level Ten", @"Level Eleven", @"Level Twelve", @"Level Thirteen", @"Level Fourteen", @"Level Fifteen", @"Level Sixteen", @"Level Seventeen", @"Level Eighteen", @"Level Nineteen", @"Level Twenty", @"Level Twenty One", @"Level Twenty Two", @"Level Twenty Three", @"Level Twenty Four", @"Level Twenty Five", @"Level Twenty Six", @"Level Twenty Seven", @"Level Twenty Eight", @"Level Twenty Nine", @"Boss Level"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            
            ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
            
            [self.navigationController pushViewController:viewController animated:YES];
            
            break; }
            
        case 1: {
            
            LevelOneViewController *oneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelOne"];
            
            [self.navigationController pushViewController:oneVC animated:YES];
            
            break; }
            
        case 2: {
            
            LevelTwoViewController *twoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwo"];
            
            [self.navigationController pushViewController:twoVC animated:YES];
            
            break; }
            
        case 3: {
            
            LevelThreeViewController *threeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThree"];
            
            [self.navigationController pushViewController:threeVC animated:YES];
            
            break; }
            
        case 4: {
            
            LevelFourViewController *fourVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFour"];
            
            [self.navigationController pushViewController:fourVC animated:YES];
            
            break; }
            
        case 5: {
            
            LevelFiveViewController *fiveVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFive"];
            
            [self.navigationController pushViewController:fiveVC animated:YES];
            
            break; }
            
        case 6:  {
            
            LevelSixViewController *sixVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSix"];
            
            [self.navigationController pushViewController:sixVC animated:YES];
            
            break; }
        
        case 7:  {
            
            LevelSevenViewController *sevenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSeven"];
            
            [self.navigationController pushViewController:sevenVC animated:YES];
            
            break; }
            
        case 8:  {
            
            LevelEightViewController *eightVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEight"];
            
            [self.navigationController pushViewController:eightVC animated:YES];
            
            break; }
            
        case 9:  {
            
            LevelNineViewController *nineVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelNine"];
            
            [self.navigationController pushViewController:nineVC animated:YES];
        
            break; }
            
        case 10:  {
            
            LevelTenViewController *tenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTen"];
            
            [self.navigationController pushViewController:tenVC animated:YES];
            
            break; }
            
        case 11:  {
            
            LevelElevenViewController *elevenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEleven"];
            
            [self.navigationController pushViewController:elevenVC animated:YES];
            
            break; }
    
        case 12: {
            
            LevelTwelveViewController *twelveVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwelve"];
            
            [self.navigationController pushViewController:twelveVC animated:YES];
            
            break; }
        
        case 13: {
            
            LevelThirteenViewController *thirteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThirteen"];
            
            [self.navigationController pushViewController:thirteenVC animated:YES];
            
            break; }
            
        case 14: {
            
            LevelFourteenViewController *fourteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFourteen"];
            
            [self.navigationController pushViewController:fourteenVC animated:YES];
            
            break; }
            
        case 15: {
            
            LevelFifteenViewController *fifteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFifteen"];
            
            [self.navigationController pushViewController:fifteenVC animated:YES];
            
            break; }
            
        case 16: {
            
            LevelSixteenViewController *sixteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSixteen"];
            
            [self.navigationController pushViewController:sixteenVC animated:YES];
            
        
            
    }
    }
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
