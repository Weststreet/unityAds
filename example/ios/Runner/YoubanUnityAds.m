//
//  YoubanUnityAds.m
//  Runner
//
//  Created by sunxy on 2019/8/4.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "YoubanUnityAds.h"

@implementation YoubanUnityAds

- (void)initialize:(NSString*)gameId :(bool)testMode{
    [UnityAds initialize:gameId delegate:self testMode:testMode];
}
- (void)unityAdsReady:(NSString *)placementId {
    NSLog(@"UADS Ready");
    
    
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message {
    NSLog(@"UnityAds ERROR: %ld - %@",(long)error, message);
    
}

- (void)unityAdsDidStart:(NSString *)placementId {
    NSLog(@"UADS Start");
    
}

- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state {
    NSString *stateString = @"UNKNOWN";
    switch (state) {
        case kUnityAdsFinishStateError:
            stateString = @"ERROR";
            break;
        case kUnityAdsFinishStateSkipped:
            stateString = @"SKIPPED";
            break;
        case kUnityAdsFinishStateCompleted:
            stateString = @"COMPLETED";
            break;
        default:
            break;
    }
    NSLog(@"UnityAds FINISH: %@ - %@", stateString, placementId);
}
@end
