//
//  LevelsListController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/17/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelsListController.h"
#import "ViewController.h"
#import "PurchasedDataController.h"
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
#import "GamePurchaseController.h"

@interface LevelsListController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *indexes;
@property (nonatomic, strong) LevelElevenViewController *elevenVC;
@property (nonatomic, strong) LevelTwelveViewController *twelveVC;
@property (nonatomic, strong) LevelThirteenViewController *thirteenVC;
@property (nonatomic, strong) LevelFourteenViewController *fourteenVC;
@property (nonatomic, strong) LevelFifteenViewController *fifteenVC;
@property (nonatomic, strong) LevelSixteenViewController *sixteenVC;
@property (nonatomic, strong) LevelSeventeenViewController *seventeenVC;
@property (nonatomic, strong) LevelEighteenViewController *eighteenVC;
@property (nonatomic, strong) LevelNineteenViewController *nineteenVC;
@property (nonatomic, strong) LevelTwentyViewController *twentyVC;
@property (nonatomic, strong) LevelTwentyOneViewController *twentyOne;
@property (nonatomic, strong) LevelTwentyTwoViewController *twentyTwo;
@property (nonatomic, strong) LevelTwentyThreeViewController *twentyThree;
@property (nonatomic, strong) LevelTwentyFourViewController *twentyFour;
@property (nonatomic, strong) LevelTwentyFiveViewController *twentyFive;
@property (nonatomic, strong) LevelTwentySixViewController *twentySix;
@property (nonatomic, strong) LevelTwentySevenViewController *twentySeven;
@property (nonatomic, strong) LevelTwentyEightViewController *twentyEight;
@property (nonatomic, strong) LevelTwentyNineViewController *twentyNine;
@property (nonatomic, strong) LevelThirtyViewController *thirty;


@end

@implementation LevelsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor blackColor];
    
    [self configureWithPurchases];
    [self registerForPurchaseNotifications];
    
    self.elevenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEleven"];
    self.twelveVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwelve"];
    self.thirteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThirteen"];
    self.fourteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFourteen"];
    self.fifteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelFifteen"];
    self.sixteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSixteen"];
    self.seventeenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelSeventeen"];
    self.eighteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelEighteen"];
    self.nineteenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelNineteen"];
    self.twentyVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwenty"];
    self.twentyOne = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyOne"];
    self.twentyTwo = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyTwo"];
    self.twentyThree = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyThree"];
    self.twentyFour = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyFour"];
    self.twentyFive = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyFive"];
    self.twentySix = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentySix"];
    self.twentySeven = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentySeven"];
    self.twentyEight = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyEight"];
    self.twentyNine = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelTwentyNine"];
    self.thirty = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelThirty"];
    
    
}

#pragma ConfiguringPurchases

- (void)configureWithPurchases {
    
    if ([PurchasedDataController sharedInstance].accessElevenThroughTwenty) {
        
        
    }
    
    if ([PurchasedDataController sharedInstance].accessTwentyOneThroughEnd) {
        
        
    }
    
    if ([PurchasedDataController sharedInstance].accessAllLevels) {
        
        
    }
}

- (void)purchasesUpdated:(NSNotification *)notification {
    
    [self configureWithPurchases];
}

- (void)registerForPurchaseNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(purchasesUpdated:) name:kPurchasedContentUpdated object:nil];
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kPurchasedContentUpdated object:nil];
}



#pragma TableViewSetUp

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([PurchasedDataController sharedInstance].accessAllLevels || [PurchasedDataController sharedInstance].accessTwentyOneThroughEnd) {
        
        return 30;
    }
    
    if ([PurchasedDataController sharedInstance].accessElevenThroughTwenty) {
        
        return 20;
    }
    
    else {
    
    return 10;
        
    }
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
            
            [self.navigationController pushViewController:self.elevenVC animated:YES];
            
            break; }
            
        case 11:  {
            
            [self.navigationController pushViewController:self.twelveVC animated:YES];
            
            break; }
    
        case 12: {
            
            [self.navigationController pushViewController:self.thirteenVC animated:YES];

            
            break; }
        
        case 13: {
            
            [self.navigationController pushViewController:self.fourteenVC animated:YES];

            
            break; }
            
        case 14: {
            
            [self.navigationController pushViewController:self.fifteenVC animated:YES];
            
            break; }
            
        case 15: {
            
            [self.navigationController pushViewController:self.sixteenVC animated:YES];
            
            break; }
            
        case 16: {
            
            [self.navigationController pushViewController:self.seventeenVC animated:YES];

            
            break; }
        
        case 17: {
            
            [self.navigationController pushViewController:self.eighteenVC animated:YES];
            
            break; }
            
        case 18: {
            
            [self.navigationController pushViewController:self.nineteenVC animated:YES];
            
            break; }
            
        case 19: {
            
            [self.navigationController pushViewController:self.twentyVC animated:YES];
        
            break; }
            
        case 20: {
        
            [self.navigationController pushViewController:self.twentyOne animated:YES];
            
            break; }
            
        case 21: {
            
            [self.navigationController pushViewController:self.twentyTwo animated:YES];
            
            break; }
            
        case 22: {
            
            [self.navigationController pushViewController:self.twentyThree animated:YES];
            
            break; }
            
        case 23: {
            
            [self.navigationController pushViewController:self.twentyFour animated:YES];

            break; }
          
        case 24: {
           
            [self.navigationController pushViewController:self.twentyFive animated:YES];
            
        break; }
            
        case 25: {
            
            [self.navigationController pushViewController:self.twentySix animated:YES];
        
        break; }
            
        case 26: {
            
            [self.navigationController pushViewController:self.twentySeven animated:YES];
        
            break; }
            
        case 27: {
            
            [self.navigationController pushViewController:self.twentyEight animated:YES];
            
            break; }
            
        case 28: {
        
            [self.navigationController pushViewController:self.twentyNine animated:YES];
            
            break;
        }
            
        case 29: {
            
            [self.navigationController pushViewController:self.thirty animated:YES];
        }
            
        
    }
}

- (IBAction)buyAllButtonClicked:(id)sender {
    
    if ([PurchasedDataController sharedInstance].accessAllLevels) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"You've already purchased all of the levels!" message:@"" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    
    else {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Purchase all levels?" message:@"Would you like to purchase all levels for $1.99?" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Not now" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Sure!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [[GamePurchaseController sharedInstance] purchaseOptionSelectedObjectIndex:2];

    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
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
