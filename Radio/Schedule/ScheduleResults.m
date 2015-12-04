//
//  ScheduleResults.m
//
//  Created by Ratna Kumalasari on 12/5/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ScheduleResults.h"


NSString *const kScheduleResultsValue2 = @"value_2";
NSString *const kScheduleResultsValue1 = @"value_1";
NSString *const kScheduleResultsFirstValue = @"first_value";


@interface ScheduleResults ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ScheduleResults

@synthesize value2 = _value2;
@synthesize value1 = _value1;
@synthesize firstValue = _firstValue;


+ (NSString *)primaryKey {
    return @"firstValue";
}

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
            self.value2 = [self objectOrNilForKey:kScheduleResultsValue2 fromDictionary:dict];
            self.value1 = [self objectOrNilForKey:kScheduleResultsValue1 fromDictionary:dict];
            self.firstValue = [self objectOrNilForKey:kScheduleResultsFirstValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.value2 forKey:kScheduleResultsValue2];
    [mutableDict setValue:self.value1 forKey:kScheduleResultsValue1];
    [mutableDict setValue:self.firstValue forKey:kScheduleResultsFirstValue];

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

    self.value2 = [aDecoder decodeObjectForKey:kScheduleResultsValue2];
    self.value1 = [aDecoder decodeObjectForKey:kScheduleResultsValue1];
    self.firstValue = [aDecoder decodeObjectForKey:kScheduleResultsFirstValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_value2 forKey:kScheduleResultsValue2];
    [aCoder encodeObject:_value1 forKey:kScheduleResultsValue1];
    [aCoder encodeObject:_firstValue forKey:kScheduleResultsFirstValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    ScheduleResults *copy = [[ScheduleResults alloc] init];
    
    if (copy) {

        copy.value2 = [self.value2 copyWithZone:zone];
        copy.value1 = [self.value1 copyWithZone:zone];
        copy.firstValue = [self.firstValue copyWithZone:zone];
    }
    
    return copy;
}


@end
