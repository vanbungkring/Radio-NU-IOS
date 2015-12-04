//
//  ScheduleOutputProperties.m
//
//  Created by Ratna Kumalasari on 12/5/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ScheduleOutputProperties.h"


NSString *const kScheduleOutputPropertiesName = @"name";
NSString *const kScheduleOutputPropertiesType = @"type";


@interface ScheduleOutputProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ScheduleOutputProperties

@synthesize name = _name;
@synthesize type = _type;


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
            self.name = [self objectOrNilForKey:kScheduleOutputPropertiesName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kScheduleOutputPropertiesType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kScheduleOutputPropertiesName];
    [mutableDict setValue:self.type forKey:kScheduleOutputPropertiesType];

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

    self.name = [aDecoder decodeObjectForKey:kScheduleOutputPropertiesName];
    self.type = [aDecoder decodeObjectForKey:kScheduleOutputPropertiesType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kScheduleOutputPropertiesName];
    [aCoder encodeObject:_type forKey:kScheduleOutputPropertiesType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ScheduleOutputProperties *copy = [[ScheduleOutputProperties alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
