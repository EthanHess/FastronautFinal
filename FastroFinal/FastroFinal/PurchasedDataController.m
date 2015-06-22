//
//  PurchasedDataController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/9/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "PurchasedDataController.h"
#import "GamePurchaseController.h"

static NSString * const kLevelsElevenThroughTwentyKey = @"ElevelThroughTwenty";
static NSString * const kLevelsTwentyOneThroughThirtyKey = @"TwentyOneThroughThirty";
static NSString * const kAllLevels = @"allLevels";

@implementation PurchasedDataController

+ (PurchasedDataController *)sharedInstance {
    static PurchasedDataController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PurchasedDataController new];
    });
    
    return sharedInstance;
    
}

- (void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(purchaseNotification:) name:kInAppPurchaseCompletedNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(purchaseNotification:) name:kInAppPurchaseRestoredNotification object:nil];
}

- (void)loadFromDefaults {
    
    self.accessElevenThroughTwenty = [[NSUserDefaults standardUserDefaults] boolForKey:kLevelsElevenThroughTwentyKey];
    
    self.accessTwentyOneThroughEnd = [[NSUserDefaults standardUserDefaults] boolForKey:kLevelsTwentyOneThroughThirtyKey];
    
    if (!self.accessElevenThroughTwenty) {
        self.accessElevenThroughTwenty = NO;
    }
    
    if (!self.accessTwentyOneThroughEnd) {
        self.accessTwentyOneThroughEnd = NO;
    }

}


- (void)setElevenThroughTwenty:(BOOL)accessible {
    
    _accessElevenThroughTwenty = accessible;
    
    [[NSUserDefaults standardUserDefaults] setBool:accessible forKey:kLevelsElevenThroughTwentyKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setTwentyOneThroughEnd:(BOOL)accessible {
    
    _accessTwentyOneThroughEnd = accessible;
    
    [[NSUserDefaults standardUserDefaults] setBool:accessible forKey:kLevelsElevenThroughTwentyKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setAllLevels:(BOOL)accessible {
    
    _accessAllLevels = accessible;
    
    [[NSUserDefaults standardUserDefaults] setBool:accessible forKey:kAllLevels];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}



- (void)purchaseNotification:(NSNotification *)notification {
    
    NSString *productIdentifer = notification.userInfo[kProductIDKey];
    
    if ([productIdentifer isEqualToString:@"com.devmtn."]) {
        self.accessElevenThroughTwenty = YES;
    }
    
    if ([productIdentifer isEqualToString:@"com.devmtn."]) {
        self.accessTwentyOneThroughEnd = YES;
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kPurchasedContentUpdated object:nil userInfo:nil];
    
}



- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
