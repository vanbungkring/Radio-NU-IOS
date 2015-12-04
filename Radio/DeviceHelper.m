//
//  DeviceHelper.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "DeviceHelper.h"
#import "CommonHelper.h"
@implementation DeviceHelper

+ (NSString *)bundleId {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)timezoneUTC {
    NSDate *currentDate = [NSDate date];
    NSString *timezoneUTC = [NSString stringWithFormat:@"%@", [CommonHelper dateStringFromDate:currentDate withFormat:@"OOOO"]];
    return timezoneUTC;
}

+ (NSString *)deviceId {
    return [CommonHelper uniqueIdentifier];
}

+ (NSString *)platform {
    return @"IOS";
}

+ (NSString *)platformVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)applicationVersion {
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString *)model {
    return [CommonHelper hardwareString];
}

+ (CGFloat)screenHeight {
    return [CommonHelper screenSize].height;
}

+ (CGFloat)screenWidth {
    return [CommonHelper screenSize].width;
}

+ (NSString *)deviceCountry {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

+ (NSString *)deviceLanguage {
    return (NSString *)[NSBundle mainBundle].preferredLocalizations.firstObject;
}

@end
