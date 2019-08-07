#import "UnityadsPlugin.h"
#import "YoubanUnityAds.h"
#import <UIKit/UIKit.h>

@implementation UnityadsPlugin
YoubanUnityAds *youbanUnityAds;
UIViewController *mViewController;
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"unityads"
            binaryMessenger:[registrar messenger]];
    
    NSLog(@"registerWithRegistrar");
    RewardVerifyedStreamHandler* rewardVerifyedStreamHandler = [[RewardVerifyedStreamHandler alloc] init];
    FlutterEventChannel* eventChannel =
    [FlutterEventChannel eventChannelWithName:@"plugins.flutter.io/unityAds"
                              binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:rewardVerifyedStreamHandler];
    
  UnityadsPlugin* instance = [[UnityadsPlugin alloc] init];
  youbanUnityAds =  [[YoubanUnityAds alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    mViewController = [[[[UIApplication sharedApplication]delegate] window]rootViewController];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"initialize" isEqualToString:call.method]) {
        [youbanUnityAds initialize:call.arguments[@"iosGameId"] :call.arguments[@"testModel"] ];
    }else if ([@"showVideo" isEqualToString:call.method]) {
        [youbanUnityAds showVideo:mViewController ];
    } else if ([@"isReady" isEqualToString:call.method]) {
        bool isReady=[youbanUnityAds isReady ];
        result(@(isReady));
   
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end


@implementation RewardVerifyedStreamHandler

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    NSLog(@"注册金币回调");
    [youbanUnityAds addRewardVerifyedHandler:^(NSString * _Nonnull result) {
        NSLog(@"%@",result);
        eventSink(result);
    }];
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    return nil;
}

@end
