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
    NSLog(@"gameId=%@ testMode=%d",gameId,testMode);
    [UnityAds initialize:gameId delegate:self testMode:false];
}

- (void)showVideo:(UIViewController *)viewController{
    [UnityAds show:viewController placementId:@"rewardedVideo"];
}

- (void)unityAdsReady:(NSString *)placementId {
    NSLog(@"UADS Ready");
    
    
}

- (bool)isReady {
    return [UnityAds isReady:@"rewardedVideo"];
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
            if(self.completionHandlers!=nil){
                NSLog(@"开始回调");
                self.completionHandlers(@"恭喜你，获取金币成功");
            }else{
                NSLog(@"注册回调失败");
            }
            break;
        default:
            break;
    }
    NSLog(@"UnityAds FINISH: %@ - %@", stateString, placementId);
}

-(void) addRewardVerifyedHandler:(completionHandler)handler {
    self.completionHandlers=handler;
}
@end
