//
//  CommonHelper.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "CommonHelper.h"
#import "DeviceHelper.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreLocation/CoreLocation.h>
#import <sys/types.h>
#import <sys/sysctl.h>
@implementation CommonHelper
+ (NSDate *)currentDate {
     return [NSDate date];
}
+ (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [CommonHelper dateFormatter];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [CommonHelper dateFormatter];
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter dateFromString:dateString];
}
+ (NSTimeInterval)getCurrentTime {
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

+ (NSDateFormatter*)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSString *language = [DeviceHelper deviceLanguage];
    NSString *localeIdentifier = @"ID";
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    return dateFormatter;
}

+ (NSString *)hardwareString {
    size_t size = 100;
    char *hw_machine = malloc(size);
    int name[] = {CTL_HW,HW_MACHINE};
    sysctl(name, 2, hw_machine, &size, NULL, 0);
    NSString *hardware = [NSString stringWithUTF8String:hw_machine];
    free(hw_machine);
    return hardware;
}

+ (CGSize)screenSize {
    return [UIScreen mainScreen].bounds.size;
}

+ (NSString *)uniqueIdentifier {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

@end
