//
//  LevelController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "LevelController.h"

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
    
    if (isComplete == YES) {
        
        [[NSUserDefaults standardUserDefaults]setBool:isComplete forKey:@"isComplete"];
    }
    
//    if (isComplete == NO) {
//        
//        [[NSUserDefaults standardUserDefaults]setBool:isComplete forKey:@"isComplete"];
//    }
    
    
}

@end
