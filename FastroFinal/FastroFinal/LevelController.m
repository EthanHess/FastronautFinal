//
//  LevelController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelController.h"

@interface LevelController ()

@property (nonatomic, strong, readwrite) NSArray *arrayOfCompletedLevels;

@end

@implementation LevelController

+ (LevelController *)sharedInstance {
    static LevelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [LevelController new];
    });
    
    return sharedInstance;
    
}

- (void)saveBool:(BOOL)isComplete {
    
    NSArray *arrayOfBooleans;
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"isCompleteArray"]) {
        
        arrayOfBooleans = [[NSUserDefaults standardUserDefaults] objectForKey:@"isCompleteArray"];
        
    } else
        
    {
        arrayOfBooleans = [[NSArray alloc]init];
    }

        arrayOfBooleans = [arrayOfBooleans arrayByAddingObject:[NSNumber numberWithBool:isComplete]];
        
        [[NSUserDefaults standardUserDefaults] setObject:arrayOfBooleans forKey:@"isCompleteArray"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(NSArray *)arrayOfCompletedLevels
{
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"isCompleteArray"];
}


@end
