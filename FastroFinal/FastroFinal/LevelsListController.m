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
#import "LevelSeventeenViewController.h"
#import "LevelEighteenViewController.h"
#import "LevelNineteenViewController.h"
#import "LevelTwentyViewController.h"
#import "LevelTwentyOneViewController.h"
#import "LevelTwentyTwoViewController.h"
#import "LevelTwentyThreeViewController.h"
#import "LevelTwentyFourViewController.h"
#import "LevelTwentyFiveViewController.h"
#import "LevelTwentySixViewController.h"
#import "LevelTwentySevenViewController.h"
#import "LevelTwentyEightViewController.h"
#import "LevelTwentyNineViewController.h"
#import "LevelThirtyViewController.h"
#import "LevelController.h"

@interface LevelsListController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LevelsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor blackColor];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}



#pragma TableViewSetUp

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self levels].count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.textColor = [UIColor greenColor];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:24];
    cell.textLabel.text = [self levels][indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FastroCell"]];
    
    if (indexPath.row == 0) {
        
        return cell;
    }
    
    else
    {
        
        if (indexPath.row > [LevelController sharedInstance].arrayOfCompletedLevels.count) {
            [cell setUserInteractionEnabled:NO];
            [cell.textLabel setTextColor:[UIColor redColor]];
        }
        else
        {
            [cell setUserInteractionEnabled:YES];
        }
        return cell;
    }
    

    
    return cell; 

}

- (NSArray *)levels {
    
    return @[@"Level One", @"Level Two", @"Level Three", @"Level Four", @"Level Five", @"Level Six", @"Level Seven", @"Level Eight", @"Level Nine", @"Level Ten", @"Level Eleven", @"Level Twelve", @"Level Thirteen", @"Level Fourteen", @"Level Fifteen", @"Level Sixteen", @"Level Seventeen", @"Level Eighteen", @"Level Nineteen", @"Level Twenty", @"Level Twenty One", @"Level Twenty Two", @"Level Twenty Three", @"Level Twenty Four", @"Level Twenty Five", @"Level Twenty Six", @"Level Twenty Seven", @"Level Twenty Eight", @"Level Twenty Nine", @"Boss Level"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            
            LevelOneViewController *oneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelOne"];
            
            [self.navigationController pushViewController:oneVC animated:YES];
            
            break; }
            
        case 1: {
            
            LevelTwoViewController *twoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwo"];
            
            [self.navigationController pushViewController:twoVC animated:YES];
            
            break; }
            
        case 2: {
            
            LevelThreeViewController *threeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThree"];
            
            [self.navigationController pushViewController:threeVC animated:YES];
            
            break; }
            
        case 3: {
            
            LevelFourViewController *fourVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFour"];
            
            [self.navigationController pushViewController:fourVC animated:YES];
            
            break; }
            
        case 4: {
            
            LevelFiveViewController *fiveVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFive"];
            
            [self.navigationController pushViewController:fiveVC animated:YES];
            
            break; }
            
        case 5: {
            
            LevelSixViewController *sixVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSix"];
            
            [self.navigationController pushViewController:sixVC animated:YES];
            
            break; }
            
        case 6:  {
            
            LevelSevenViewController *sevenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSeven"];
            
            [self.navigationController pushViewController:sevenVC animated:YES];
            
            break; }
        
        case 7:  {
            
            LevelEightViewController *eightVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEight"];
            
            [self.navigationController pushViewController:eightVC animated:YES];
            
            break; }
            
        case 8:  {
            
            LevelNineViewController *nineVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelNine"];
            
            [self.navigationController pushViewController:nineVC animated:YES];
            
            break; }
            
        case 9:  {
            
            LevelTenViewController *tenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTen"];
            
            [self.navigationController pushViewController:tenVC animated:YES];
        
            break; }
            
        case 10:  {
            
            LevelElevenViewController *elevenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEleven"];
            
            [self.navigationController pushViewController:elevenVC animated:YES];
            
            break; }
            
        case 11:  {
            
            LevelTwelveViewController *twelveVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwelve"];
            
            [self.navigationController pushViewController:twelveVC animated:YES];
            
            break; }
    
        case 12: {
            
            LevelThirteenViewController *thirteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThirteen"];
            
            [self.navigationController pushViewController:thirteenVC animated:YES];

            break; }
        
        case 13: {
            
            LevelFourteenViewController *fourteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFourteen"];
            
            [self.navigationController pushViewController:fourteenVC animated:YES];
        
            break; }
            
        case 14: {
            
            LevelFifteenViewController *fifteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFifteen"];
            
            [self.navigationController pushViewController:fifteenVC animated:YES];
            
            break; }
            
        case 15: {
            
            LevelSixteenViewController *sixteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSixteen"];
            
            [self.navigationController pushViewController:sixteenVC animated:YES];
            
            break; }
            
        case 16: {
            
            LevelSeventeenViewController *seventeenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSeventeen"];
            
            [self.navigationController pushViewController:seventeenVC animated:YES];

            break; }
        
        case 17: {
            
            LevelEighteenViewController *eighteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEighteen"];
            
            [self.navigationController pushViewController:eighteenVC animated:YES];
            
            break; }
            
        case 18: {
            
            LevelNineteenViewController *nineteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelNineteen"];
            
            [self.navigationController pushViewController:nineteenVC animated:YES];
            
            break; }
            
        case 19: {
            
            LevelTwentyViewController *twentyVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwenty"];
            
            [self.navigationController pushViewController:twentyVC animated:YES];
        
            break; }
            
        case 20: {
            
            LevelTwentyOneViewController *twentyOne = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyOne"];
        
            [self.navigationController pushViewController:twentyOne animated:YES];
            
            break; }
            
        case 21: {
            
            LevelTwentyTwoViewController *twentyTwo = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyTwo"];
            
            [self.navigationController pushViewController:twentyTwo animated:YES];
            
            break; }
            
        case 22: {
            
            LevelTwentyThreeViewController *twentyThree = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyThree"];
            
            [self.navigationController pushViewController:twentyThree animated:YES];
            
            break; }
            
        case 23: {
            
            LevelTwentyFourViewController *twentyFour = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyFour"];
            
            [self.navigationController pushViewController:twentyFour animated:YES];

            break; }
          
        case 24: {
            
            LevelTwentyFiveViewController *twentyFive = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyFive"];
           
            [self.navigationController pushViewController:twentyFive animated:YES];
            
        break; }
            
        case 25: {
            
            LevelTwentySixViewController *twentySix = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentySix"];
            
            [self.navigationController pushViewController:twentySix animated:YES];
        
        break; }
            
        case 26: {
            
            LevelTwentySevenViewController *twentySeven = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentySeven"];
            
            [self.navigationController pushViewController:twentySeven animated:YES];
        
            break; }
            
        case 27: {
            
            LevelTwentyEightViewController *twentyEight = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyEight"];
            
            [self.navigationController pushViewController:twentyEight animated:YES];
            
            break; }
            
        case 28: {
            
            LevelTwentyNineViewController *twentyNine = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyNine"];
        
            [self.navigationController pushViewController:twentyNine animated:YES];
            
            break;
        }
            
        case 29: {
            
            LevelThirtyViewController *thirty = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThirty"];
            
            [self.navigationController pushViewController:thirty animated:YES];
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
