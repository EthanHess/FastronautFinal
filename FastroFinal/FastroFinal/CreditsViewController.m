//
//  CreditsViewController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CreditsViewController.h"
#import "SoundController.h"

@interface CreditsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreditsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[SoundController sharedInstance]cancelAudio];
    
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    
//    if (section == 0) {
//        
//        return @"Game credits";
//    }
//    
//    if (section == 1) {
//        
//        return @"Sound effects";
//    }
//    
//    else {
//        
//        return @"Music tracks";
//    }
//    
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    sectionHeaderView.backgroundColor = [UIColor blackColor];
    
    UILabel *creditsLabel = [[UILabel alloc]initWithFrame:sectionHeaderView.bounds];
    creditsLabel.textColor = [UIColor greenColor];
    creditsLabel.font = [UIFont fontWithName:@"Chalkduster" size:18];
    
    if (section == 0) {
        
        creditsLabel.text = @"Game credits";
    }
    
    if (section == 1) {
        
        creditsLabel.text = @"Sound effects";
    }
    
    else {
        
        creditsLabel.text = @"Music tracks";
    }
    
    [sectionHeaderView addSubview:creditsLabel];
    
    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creditCell"];
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor greenColor];
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:14];
    
    if (indexPath.section == 0) {
        
        cell.textLabel.text = [self GameCredits][indexPath.row];
        
    }
    
    if (indexPath.section == 1) {
       
        cell.textLabel.text = [self SoundEffects][indexPath.row];
        
    }
    
    if (indexPath.section == 2) {
        
        cell.textLabel.text = [self MusicTracks][indexPath.row];
        
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return [self GameCredits].count;
    }
    
    if (section == 1) {
        
        return [self SoundEffects].count;
    }
    
    else {
        
        return [self MusicTracks].count;
    }
    
    
}

- (NSArray *)GameCredits {
    
    return @[@"Game and animations by Ethan Hess", @"Music by Kevin MacLeod"];
    
}

- (NSArray *)SoundEffects {
    
    return @[@"http://www.freesound.org/people/Aiwha/sounds/196106/",@"http://www.freesound.org/people/LittleRobotSoundFactory/sounds/274183/", @"http://www.freesound.org/people/Jagadamba/sounds/254764/"];
    
}

- (NSArray *)MusicTracks {
    
    return @[@"'One Sly Move' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Son Of A Rocket' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Your Call' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Electro Cabello' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Carnivale Intrigue' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Severe Tire Damage' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Skye Cuillin' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Disco Medusae' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Super Friendly' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Shiny Tech2' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Sunflower Dance Party' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Zanzibar' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'EDM Detection Mode' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Nano Hoedown' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Electro Sketch' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Discovery Hit' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Lightless Dawn' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Exit the Premises' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Take a Chance' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'The Complex' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Secrets of the Schoolyard' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'The Curtain Rises' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Killing Time' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Controlled Chaos' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Enter the Maze' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Five Armies' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'GhostPocalypse - 7 Master' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Hero Down' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Hit the Streets v2' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Ibn Al-Noor' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Rising' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Space Fighter Loop' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'The Whip Theme' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/", @"'Who Likes to Party' Kevin MacLeod (incompetech.com) Licensed under Creative Commons: By Attribution 3.0 http://creativecommons.org/licenses/by/3.0/"];
    
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
