//
//  ScheduleResponse.h
//
//  Created by Ratna Kumalasari on 12/5/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface ScheduleResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double offset;
@property (nonatomic, strong) NSString *connectorGuid;
@property (nonatomic, strong) NSArray *cookies;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSArray *outputProperties;
@property (nonatomic, strong) NSString *connectorVersionGuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
+ (NSURLSessionDataTask *)getScheduleWithCompletionBlock:(void(^)(NSArray *json,NSError *error))completion;
+ (NSArray *)allSchedule;
@end
