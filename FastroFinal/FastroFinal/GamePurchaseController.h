//
//  GamePurchaseController.h
//  FastroFinal
//
//  Created by Ethan Hess on 6/9/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

static NSString * const kInAppPurchaseFetchedNotification = @"kInAppPurchaseFetchedNotification";
static NSString * const kInAppPurchaseCompletedNotification = @"kInAppPurchaseCompletedNotification";
static NSString * const kInAppPurchaseRestoredNotification = @"kInAppPurchaseRestoredNotification";

static NSString * const kProductIDKey = @"productID";

@interface GamePurchaseController : NSObject

+ (GamePurchaseController *)sharedInstance; 

@end
