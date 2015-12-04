//
//  DeviceHelper.h
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DeviceHelper : NSObject
+ (NSString *)bundleId;
+ (NSString *)timezoneUTC;
+ (NSString *)deviceId;
+ (NSString *)platform;
+ (NSString *)platformVersion;
+ (NSString *)applicationVersion;
+ (NSString *)model;
+ (NSString *)deviceCountry;
+ (NSString *)deviceLanguage;
+ (CGFloat)screenHeight;
+ (CGFloat)screenWidth;
@end
