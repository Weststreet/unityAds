//
//  YoubanUnityAds.h
//  Runner
//
//  Created by sunxy on 2019/8/4.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UnityAds/UnityAds.h>

NS_ASSUME_NONNULL_BEGIN

@interface YoubanUnityAds : NSObject <UnityAdsDelegate>
- (void)initialize:(NSString*)gameId :(bool)testMode;
@end

NS_ASSUME_NONNULL_END
