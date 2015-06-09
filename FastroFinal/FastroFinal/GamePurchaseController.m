//
//  GamePurchaseController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/9/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "GamePurchaseController.h"

@implementation GamePurchaseController

+ (GamePurchaseController *)sharedInstance {
    static GamePurchaseController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [GamePurchaseController new];
    });
    
    return sharedInstance;
    
}

@end
