//
//  SoundEffectsController.h
//  FastroFinal
//
//  Created by Ethan Hess on 6/22/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundEffectsController : NSObject

+ (SoundEffectsController *)sharedInstance;

- (void)playFileAtURL:(NSURL *)url;

- (void)cancelAudio;

@end

