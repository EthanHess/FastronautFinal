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
    
    return @[@"Home Screen", @"Level One", @"Level Two", @"Level Three", @"Level Four", @"Level Five", @"Level Six", @"Level Seven", @"Level Eight", @"Level Nine", @"Level Ten",];
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
