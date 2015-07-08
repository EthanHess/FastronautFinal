//
//  SoundController.m
//  FastroFinal
//
//  Created by Ethan Hess on 5/17/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SoundController.h"

@interface SoundController()

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation SoundController

+ (SoundController *)sharedInstance {
    static SoundController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SoundController new];
    });
    
    return sharedInstance;
    
}

- (void)playFileAtURL:(NSURL *)url {
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.player.numberOfLoops = 2;
    [self.player play];
    
}

- (void)cancelAudio {
    
    [self.player stop];
    
}

@end
