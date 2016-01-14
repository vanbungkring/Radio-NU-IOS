//
//  QuranicResponse.m
//
//  Created by Ratna Kumalasari on 12/6/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QuranicResponse.h"
#import "QuranicPosts.h"
#import "APIManager.h"
#import "StaticAndPreferences.h"

NSString *const kQuranicResponseStatus = @"status";
NSString *const kQuranicResponsePages = @"pages";
NSString *const kQuranicResponseCountTotal = @"count_total";
NSString *const kQuranicResponseCount = @"count";
NSString *const kQuranicResponsePosts = @"posts";


@interface QuranicResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QuranicResponse

@synthesize status = _status;
@synthesize pages = _pages;
@synthesize countTotal = _countTotal;
@synthesize count = _count;
@synthesize posts = _posts;


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
            self.status = [self objectOrNilForKey:kQuranicResponseStatus fromDictionary:dict];
            self.pages = [[self objectOrNilForKey:kQuranicResponsePages fromDictionary:dict] doubleValue];
            self.countTotal = [[self objectOrNilForKey:kQuranicResponseCountTotal fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kQuranicResponseCount fromDictionary:dict] doubleValue];
    NSObject *receivedQuranicPosts = [dict objectForKey:kQuranicResponsePosts];
    NSMutableArray *parsedQuranicPosts = [NSMutableArray array];
    if ([receivedQuranicPosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedQuranicPosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedQuranicPosts addObject:[QuranicPosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedQuranicPosts isKindOfClass:[NSDictionary class]]) {
       [parsedQuranicPosts addObject:[QuranicPosts modelObjectWithDictionary:(NSDictionary *)receivedQuranicPosts]];
    }

    self.posts = [NSArray arrayWithArray:parsedQuranicPosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kQuranicResponseStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kQuranicResponsePages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countTotal] forKey:kQuranicResponseCountTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kQuranicResponseCount];
    NSMutableArray *tempArrayForPosts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.posts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPosts] forKey:kQuranicResponsePosts];

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

    self.status = [aDecoder decodeObjectForKey:kQuranicResponseStatus];
    self.pages = [aDecoder decodeDoubleForKey:kQuranicResponsePages];
    self.countTotal = [aDecoder decodeDoubleForKey:kQuranicResponseCountTotal];
    self.count = [aDecoder decodeDoubleForKey:kQuranicResponseCount];
    self.posts = [aDecoder decodeObjectForKey:kQuranicResponsePosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kQuranicResponseStatus];
    [aCoder encodeDouble:_pages forKey:kQuranicResponsePages];
    [aCoder encodeDouble:_countTotal forKey:kQuranicResponseCountTotal];
    [aCoder encodeDouble:_count forKey:kQuranicResponseCount];
    [aCoder encodeObject:_posts forKey:kQuranicResponsePosts];
}

- (id)copyWithZone:(NSZone *)zone
{
    QuranicResponse *copy = [[QuranicResponse alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.pages = self.pages;
        copy.countTotal = self.countTotal;
        copy.count = self.count;
        copy.posts = [self.posts copyWithZone:zone];
    }
    
    return copy;
}
+ (NSURLSessionDataTask *)getQuranicQuotesWithParams:(NSDictionary *)params CompletionBlock:(void(^)(NSArray *json,NSError *error))completion {
    return [[APIManager sharedClient] GET:QURANIC_URL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSMutableArray *mutablePosts = [[NSMutableArray alloc]init];
        for (NSDictionary *attributes in [responseObject valueForKey:@"posts"]) {
            QuranicPosts *userData = [[QuranicPosts alloc] initWithDictionary:attributes];
            [mutablePosts addObject:userData];
        }
        if (completion) {
            completion([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (completion) {
            completion([NSArray array], error);
        }
    }];
}

@end
