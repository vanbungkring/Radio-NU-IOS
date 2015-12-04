//
//  CommonHelper.h
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IS_IOS8_OR_ABOVE                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
@interface CommonHelper : NSObject
+ (NSDate *)currentDate;
+ (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat;
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;
+ (NSDateFormatter*)dateFormatter;
+ (NSString *)hardwareString;
+ (NSString *)uniqueIdentifier;
+ (CGSize)screenSize;
+ (NSTimeInterval)getCurrentTime;
@end
