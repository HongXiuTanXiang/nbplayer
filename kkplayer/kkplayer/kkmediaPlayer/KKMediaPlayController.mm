//
//  KKMediaPlayController.m
//  kkplayer
//
//  Created by Mac on 2019/10/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "KKMediaPlayController.h"
#import "KKCoreMediaPlayer.h"


@interface KKMediaPlayController ()

@end



@implementation KKMediaPlayController{
    KKCoreMediaPlayer *mediaPlayer;
}

@synthesize glView = _glView;
@synthesize currentPlaybackTime;
@synthesize duration;
@synthesize playableDuration;
@synthesize bufferingProgress = _bufferingProgress;

@synthesize numberOfBytesTransferred = _numberOfBytesTransferred;

@synthesize isPreparedToPlay = _isPreparedToPlay;
@synthesize playbackState = _playbackState;
@synthesize loadState = _loadState;

@synthesize naturalSize = _naturalSize;
@synthesize scalingMode = _scalingMode;
@synthesize shouldAutoplay = _shouldAutoplay;

@synthesize allowsMediaAirPlay = _allowsMediaAirPlay;
@synthesize airPlayMediaActive = _airPlayMediaActive;

@synthesize isDanmakuMediaAirPlay = _isDanmakuMediaAirPlay;

@synthesize isSeekBuffering = _isSeekBuffering;
@synthesize isAudioSync = _isAudioSync;
@synthesize isVideoSync = _isVideoSync;
@synthesize playbackRate = _playbackRate;
@synthesize playbackVolume = _playbackVolume;


- (instancetype)init
{
    self = [super init];
    if (self) {
        KKCoreMediaPlayer().kk_core_prepare_async("file_name");
    }
    return self;
}

// MARK: ------播放控制----
- (void)prepareToPlay:(NSString*)url{
    
}

- (void)play{

}

- (void)pause{
    
}

- (void)stop{
    
}

- (BOOL)isPlaying{
    return true;
}

- (void)shutdown{
    
}

- (void)setPauseInBackground:(BOOL)pause{
    
}

- (UIImage *)thumbnailImageAtCurrentTime{
    return [[UIImage alloc]init];
}

@end




