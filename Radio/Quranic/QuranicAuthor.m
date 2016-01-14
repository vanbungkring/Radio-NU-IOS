//
//  QuranicAuthor.m
//
//  Created by Ratna Kumalasari on 12/6/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QuranicAuthor.h"


NSString *const kQuranicAuthorSlug = @"slug";
NSString *const kQuranicAuthorUrl = @"url";
NSString *const kQuranicAuthorId = @"id";
NSString *const kQuranicAuthorNickname = @"nickname";
NSString *const kQuranicAuthorLastName = @"last_name";
NSString *const kQuranicAuthorDescription = @"description";
NSString *const kQuranicAuthorName = @"name";
NSString *const kQuranicAuthorFirstName = @"first_name";


@interface QuranicAuthor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QuranicAuthor

@synthesize slug = _slug;
@synthesize url = _url;
@synthesize authorIdentifier = _authorIdentifier;
@synthesize nickname = _nickname;
@synthesize lastName = _lastName;
@synthesize authorDescription = _authorDescription;
@synthesize name = _name;
@synthesize firstName = _firstName;


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
            self.slug = [self objectOrNilForKey:kQuranicAuthorSlug fromDictionary:dict];
            self.url = [self objectOrNilForKey:kQuranicAuthorUrl fromDictionary:dict];
            self.authorIdentifier = [[self objectOrNilForKey:kQuranicAuthorId fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kQuranicAuthorNickname fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kQuranicAuthorLastName fromDictionary:dict];
            self.authorDescription = [self objectOrNilForKey:kQuranicAuthorDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kQuranicAuthorName fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kQuranicAuthorFirstName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.slug forKey:kQuranicAuthorSlug];
    [mutableDict setValue:self.url forKey:kQuranicAuthorUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorIdentifier] forKey:kQuranicAuthorId];
    [mutableDict setValue:self.nickname forKey:kQuranicAuthorNickname];
    [mutableDict setValue:self.lastName forKey:kQuranicAuthorLastName];
    [mutableDict setValue:self.authorDescription forKey:kQuranicAuthorDescription];
    [mutableDict setValue:self.name forKey:kQuranicAuthorName];
    [mutableDict setValue:self.firstName forKey:kQuranicAuthorFirstName];

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

    self.slug = [aDecoder decodeObjectForKey:kQuranicAuthorSlug];
    self.url = [aDecoder decodeObjectForKey:kQuranicAuthorUrl];
    self.authorIdentifier = [aDecoder decodeDoubleForKey:kQuranicAuthorId];
    self.nickname = [aDecoder decodeObjectForKey:kQuranicAuthorNickname];
    self.lastName = [aDecoder decodeObjectForKey:kQuranicAuthorLastName];
    self.authorDescription = [aDecoder decodeObjectForKey:kQuranicAuthorDescription];
    self.name = [aDecoder decodeObjectForKey:kQuranicAuthorName];
    self.firstName = [aDecoder decodeObjectForKey:kQuranicAuthorFirstName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_slug forKey:kQuranicAuthorSlug];
    [aCoder encodeObject:_url forKey:kQuranicAuthorUrl];
    [aCoder encodeDouble:_authorIdentifier forKey:kQuranicAuthorId];
    [aCoder encodeObject:_nickname forKey:kQuranicAuthorNickname];
    [aCoder encodeObject:_lastName forKey:kQuranicAuthorLastName];
    [aCoder encodeObject:_authorDescription forKey:kQuranicAuthorDescription];
    [aCoder encodeObject:_name forKey:kQuranicAuthorName];
    [aCoder encodeObject:_firstName forKey:kQuranicAuthorFirstName];
}

- (id)copyWithZone:(NSZone *)zone
{
    QuranicAuthor *copy = [[QuranicAuthor alloc] init];
    
    if (copy) {

        copy.slug = [self.slug copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.authorIdentifier = self.authorIdentifier;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.authorDescription = [self.authorDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
    }
    
    return copy;
}


@end
