//
//  LevelController.h
//  FastroFinal
//
//  Created by Ethan Hess on 6/3/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevelController : NSObject

@property (nonatomic, strong, readonly) NSArray *arrayOfCompletedLevels;

+ (LevelController *)sharedInstance;
- (void)saveBool:(BOOL)isComplete; 

@end
