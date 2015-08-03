//
//  PurchasedDataController.h
//  FastroFinal
//
//  Created by Ethan Hess on 6/9/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kPurchasedContentUpdated = @"kPurchasedContentUpdated";

@interface PurchasedDataController : NSObject

@property (nonatomic) BOOL accessElevenThroughTwenty;
@property (nonatomic) BOOL accessTwentyOneThroughEnd;
@property (nonatomic) BOOL accessAllLevels;
//@property (nonatomic, strong) NSMutableArray *unlockedlevels;

+ (PurchasedDataController *)sharedInstance;

- (void)setElevenThroughTwenty:(BOOL)accessible;
- (void)setTwentyOneThroughEnd:(BOOL)accessible;
- (void)setAllLevels:(BOOL)accessible; 

@end
