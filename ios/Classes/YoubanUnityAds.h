//
//  YoubanUnityAds.h
//  Runner
//
//  Created by sunxy on 2019/8/4.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UnityAds/UnityAds.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^completionHandler)(NSString* result);
@interface YoubanUnityAds : NSObject <UnityAdsDelegate>
- (void)initialize:(NSString*)gameId :(bool)testMode;
- (void)showVideo:(UIViewController*)viewController;
- (bool)isReady;
-(void) addRewardVerifyedHandler:(completionHandler)handler;
@property (nonatomic, strong) completionHandler completionHandlers;
@end

NS_ASSUME_NONNULL_END
