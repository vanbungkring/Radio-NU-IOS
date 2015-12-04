//
//  ScheduleResponse.m
//
//  Created by Ratna Kumalasari on 12/5/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ScheduleResponse.h"
#import "ScheduleResults.h"
#import "DatabaseManager.h"
#import "APIManager.h"
#import <Realm/RLMArray.h>
#import "StaticAndPreferences.h"
#import "ScheduleOutputProperties.h"


NSString *const kScheduleResponseOffset = @"offset";
NSString *const kScheduleResponseConnectorGuid = @"connectorGuid";
NSString *const kScheduleResponseCookies = @"cookies";
NSString *const kScheduleResponsePageUrl = @"pageUrl";
NSString *const kScheduleResponseResults = @"results";
NSString *const kScheduleResponseOutputProperties = @"outputProperties";
NSString *const kScheduleResponseConnectorVersionGuid = @"connectorVersionGuid";


@interface ScheduleResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ScheduleResponse

@synthesize offset = _offset;
@synthesize connectorGuid = _connectorGuid;
@synthesize cookies = _cookies;
@synthesize pageUrl = _pageUrl;
@synthesize results = _results;
@synthesize outputProperties = _outputProperties;
@synthesize connectorVersionGuid = _connectorVersionGuid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.offset = [[self objectOrNilForKey:kScheduleResponseOffset fromDictionary:dict] doubleValue];
            self.connectorGuid = [self objectOrNilForKey:kScheduleResponseConnectorGuid fromDictionary:dict];
            self.cookies = [self objectOrNilForKey:kScheduleResponseCookies fromDictionary:dict];
            self.pageUrl = [self objectOrNilForKey:kScheduleResponsePageUrl fromDictionary:dict];
    NSObject *receivedScheduleResults = [dict objectForKey:kScheduleResponseResults];
    NSMutableArray *parsedScheduleResults = [NSMutableArray array];
    if ([receivedScheduleResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedScheduleResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedScheduleResults addObject:[ScheduleResults modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedScheduleResults isKindOfClass:[NSDictionary class]]) {
       [parsedScheduleResults addObject:[ScheduleResults modelObjectWithDictionary:(NSDictionary *)receivedScheduleResults]];
    }

    self.results = [NSArray arrayWithArray:parsedScheduleResults];
    NSObject *receivedScheduleOutputProperties = [dict objectForKey:kScheduleResponseOutputProperties];
    NSMutableArray *parsedScheduleOutputProperties = [NSMutableArray array];
    if ([receivedScheduleOutputProperties isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedScheduleOutputProperties) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedScheduleOutputProperties addObject:[ScheduleOutputProperties modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedScheduleOutputProperties isKindOfClass:[NSDictionary class]]) {
       [parsedScheduleOutputProperties addObject:[ScheduleOutputProperties modelObjectWithDictionary:(NSDictionary *)receivedScheduleOutputProperties]];
    }

    self.outputProperties = [NSArray arrayWithArray:parsedScheduleOutputProperties];
            self.connectorVersionGuid = [self objectOrNilForKey:kScheduleResponseConnectorVersionGuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.offset] forKey:kScheduleResponseOffset];
    [mutableDict setValue:self.connectorGuid forKey:kScheduleResponseConnectorGuid];
    NSMutableArray *tempArrayForCookies = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cookies) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCookies addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCookies addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCookies] forKey:kScheduleResponseCookies];
    [mutableDict setValue:self.pageUrl forKey:kScheduleResponsePageUrl];
    NSMutableArray *tempArrayForResults = [NSMutableArray array];
    for (NSObject *subArrayObject in self.results) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:kScheduleResponseResults];
    NSMutableArray *tempArrayForOutputProperties = [NSMutableArray array];
    for (NSObject *subArrayObject in self.outputProperties) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOutputProperties addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOutputProperties addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOutputProperties] forKey:kScheduleResponseOutputProperties];
    [mutableDict setValue:self.connectorVersionGuid forKey:kScheduleResponseConnectorVersionGuid];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.offset = [aDecoder decodeDoubleForKey:kScheduleResponseOffset];
    self.connectorGuid = [aDecoder decodeObjectForKey:kScheduleResponseConnectorGuid];
    self.cookies = [aDecoder decodeObjectForKey:kScheduleResponseCookies];
    self.pageUrl = [aDecoder decodeObjectForKey:kScheduleResponsePageUrl];
    self.results = [aDecoder decodeObjectForKey:kScheduleResponseResults];
    self.outputProperties = [aDecoder decodeObjectForKey:kScheduleResponseOutputProperties];
    self.connectorVersionGuid = [aDecoder decodeObjectForKey:kScheduleResponseConnectorVersionGuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_offset forKey:kScheduleResponseOffset];
    [aCoder encodeObject:_connectorGuid forKey:kScheduleResponseConnectorGuid];
    [aCoder encodeObject:_cookies forKey:kScheduleResponseCookies];
    [aCoder encodeObject:_pageUrl forKey:kScheduleResponsePageUrl];
    [aCoder encodeObject:_results forKey:kScheduleResponseResults];
    [aCoder encodeObject:_outputProperties forKey:kScheduleResponseOutputProperties];
    [aCoder encodeObject:_connectorVersionGuid forKey:kScheduleResponseConnectorVersionGuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    ScheduleResponse *copy = [[ScheduleResponse alloc] init];
    
    if (copy) {

        copy.offset = self.offset;
        copy.connectorGuid = [self.connectorGuid copyWithZone:zone];
        copy.cookies = [self.cookies copyWithZone:zone];
        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.results = [self.results copyWithZone:zone];
        copy.outputProperties = [self.outputProperties copyWithZone:zone];
        copy.connectorVersionGuid = [self.connectorVersionGuid copyWithZone:zone];
    }
    
    return copy;
}
+ (NSURLSessionDataTask *)getScheduleWithCompletionBlock:(void(^)(NSArray *json,NSError *error))completion {

    return [[APIManager sharedClient] GET:SCHEDULE_URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSMutableArray *mutablePosts = [[NSMutableArray alloc]init];
        for (NSDictionary *attributes in [responseObject valueForKey:@"results"]) {
            ScheduleResults *userData = [[ScheduleResults alloc] initWithDictionary:attributes];
            [mutablePosts addObject:userData];
        }
        [ScheduleResponse storeToDb:mutablePosts];
        if (completion) {
           
            completion([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (completion) {
            completion([NSArray array], error);
        }
    }];
}

+ (void)storeToDb:(NSArray *)schedule {
    for (int i = 0; i < schedule.count; i++) {
        ScheduleResults *scheduleObject = (ScheduleResults *)[schedule objectAtIndex:i];
        [[DataBaseManager manager] writeOrUpdateObject:scheduleObject];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:fetchScheduleDone object:nil];
}
+ (NSArray *)allSchedule {
    RLMResults *resultsRealm = [ScheduleResults allObjectsInRealm:[RLMRealm defaultRealm]];
    NSMutableArray *result = [NSMutableArray array];
    for (RLMObject *obj in resultsRealm) {
        [result addObject:obj];
    }
    
    return result;
}
@end
