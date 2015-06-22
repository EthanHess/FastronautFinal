//
//  SoundEffectsController.m
//  FastroFinal
//
//  Created by Ethan Hess on 6/22/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SoundEffectsController.h"

@interface SoundEffectsController()

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation SoundEffectsController

+ (SoundEffectsController *)sharedInstance {
    static SoundEffectsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SoundEffectsController new];
    });
    
    return sharedInstance;
    
}

- (void)playFileAtURL:(NSURL *)url {
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.player.numberOfLoops = 0;
    [self.player play];
    
}

- (void)cancelAudio {
    
    [self.player stop];
    
}

@end