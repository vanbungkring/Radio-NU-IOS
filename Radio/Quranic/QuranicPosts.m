//
//  QuranicPosts.m
//
//  Created by Ratna Kumalasari on 12/6/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QuranicPosts.h"
#import "QuranicAuthor.h"
#import "QuranicCustomFields.h"


NSString *const kQuranicPostsId = @"id";
NSString *const kQuranicPostsComments = @"comments";
NSString *const kQuranicPostsCategories = @"categories";
NSString *const kQuranicPostsCommentCount = @"comment_count";
NSString *const kQuranicPostsExcerpt = @"excerpt";
NSString *const kQuranicPostsAuthor = @"author";
NSString *const kQuranicPostsModified = @"modified";
NSString *const kQuranicPostsTitlePlain = @"title_plain";
NSString *const kQuranicPostsTags = @"tags";
NSString *const kQuranicPostsType = @"type";
NSString *const kQuranicPostsTitle = @"title";
NSString *const kQuranicPostsUrl = @"url";
NSString *const kQuranicPostsDate = @"date";
NSString *const kQuranicPostsCommentStatus = @"comment_status";
NSString *const kQuranicPostsSlug = @"slug";
NSString *const kQuranicPostsAttachments = @"attachments";
NSString *const kQuranicPostsCustomFields = @"custom_fields";
NSString *const kQuranicPostsStatus = @"status";
NSString *const kQuranicPostsContent = @"content";


@interface QuranicPosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QuranicPosts

@synthesize postsIdentifier = _postsIdentifier;
@synthesize comments = _comments;
@synthesize categories = _categories;
@synthesize commentCount = _commentCount;
@synthesize excerpt = _excerpt;
@synthesize author = _author;
@synthesize modified = _modified;
@synthesize titlePlain = _titlePlain;
@synthesize tags = _tags;
@synthesize type = _type;
@synthesize title = _title;
@synthesize url = _url;
@synthesize date = _date;
@synthesize commentStatus = _commentStatus;
@synthesize slug = _slug;
@synthesize attachments = _attachments;
@synthesize customFields = _customFields;
@synthesize status = _status;
@synthesize content = _content;


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
            self.postsIdentifier = [[self objectOrNilForKey:kQuranicPostsId fromDictionary:dict] doubleValue];
            self.comments = [self objectOrNilForKey:kQuranicPostsComments fromDictionary:dict];
            self.categories = [self objectOrNilForKey:kQuranicPostsCategories fromDictionary:dict];
            self.commentCount = [[self objectOrNilForKey:kQuranicPostsCommentCount fromDictionary:dict] doubleValue];
            self.excerpt = [self objectOrNilForKey:kQuranicPostsExcerpt fromDictionary:dict];
            self.author = [QuranicAuthor modelObjectWithDictionary:[dict objectForKey:kQuranicPostsAuthor]];
            self.modified = [self objectOrNilForKey:kQuranicPostsModified fromDictionary:dict];
            self.titlePlain = [self objectOrNilForKey:kQuranicPostsTitlePlain fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kQuranicPostsTags fromDictionary:dict];
            self.type = [self objectOrNilForKey:kQuranicPostsType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kQuranicPostsTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kQuranicPostsUrl fromDictionary:dict];
            self.date = [self objectOrNilForKey:kQuranicPostsDate fromDictionary:dict];
            self.commentStatus = [self objectOrNilForKey:kQuranicPostsCommentStatus fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kQuranicPostsSlug fromDictionary:dict];
            self.attachments = [self objectOrNilForKey:kQuranicPostsAttachments fromDictionary:dict];
            self.customFields = [QuranicCustomFields modelObjectWithDictionary:[dict objectForKey:kQuranicPostsCustomFields]];
            self.status = [self objectOrNilForKey:kQuranicPostsStatus fromDictionary:dict];
            self.content = [self objectOrNilForKey:kQuranicPostsContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postsIdentifier] forKey:kQuranicPostsId];
    NSMutableArray *tempArrayForComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.comments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComments] forKey:kQuranicPostsComments];
    NSMutableArray *tempArrayForCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategories] forKey:kQuranicPostsCategories];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kQuranicPostsCommentCount];
    [mutableDict setValue:self.excerpt forKey:kQuranicPostsExcerpt];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kQuranicPostsAuthor];
    [mutableDict setValue:self.modified forKey:kQuranicPostsModified];
    [mutableDict setValue:self.titlePlain forKey:kQuranicPostsTitlePlain];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kQuranicPostsTags];
    [mutableDict setValue:self.type forKey:kQuranicPostsType];
    [mutableDict setValue:self.title forKey:kQuranicPostsTitle];
    [mutableDict setValue:self.url forKey:kQuranicPostsUrl];
    [mutableDict setValue:self.date forKey:kQuranicPostsDate];
    [mutableDict setValue:self.commentStatus forKey:kQuranicPostsCommentStatus];
    [mutableDict setValue:self.slug forKey:kQuranicPostsSlug];
    NSMutableArray *tempArrayForAttachments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.attachments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAttachments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAttachments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAttachments] forKey:kQuranicPostsAttachments];
    [mutableDict setValue:[self.customFields dictionaryRepresentation] forKey:kQuranicPostsCustomFields];
    [mutableDict setValue:self.status forKey:kQuranicPostsStatus];
    [mutableDict setValue:self.content forKey:kQuranicPostsContent];

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

    self.postsIdentifier = [aDecoder decodeDoubleForKey:kQuranicPostsId];
    self.comments = [aDecoder decodeObjectForKey:kQuranicPostsComments];
    self.categories = [aDecoder decodeObjectForKey:kQuranicPostsCategories];
    self.commentCount = [aDecoder decodeDoubleForKey:kQuranicPostsCommentCount];
    self.excerpt = [aDecoder decodeObjectForKey:kQuranicPostsExcerpt];
    self.author = [aDecoder decodeObjectForKey:kQuranicPostsAuthor];
    self.modified = [aDecoder decodeObjectForKey:kQuranicPostsModified];
    self.titlePlain = [aDecoder decodeObjectForKey:kQuranicPostsTitlePlain];
    self.tags = [aDecoder decodeObjectForKey:kQuranicPostsTags];
    self.type = [aDecoder decodeObjectForKey:kQuranicPostsType];
    self.title = [aDecoder decodeObjectForKey:kQuranicPostsTitle];
    self.url = [aDecoder decodeObjectForKey:kQuranicPostsUrl];
    self.date = [aDecoder decodeObjectForKey:kQuranicPostsDate];
    self.commentStatus = [aDecoder decodeObjectForKey:kQuranicPostsCommentStatus];
    self.slug = [aDecoder decodeObjectForKey:kQuranicPostsSlug];
    self.attachments = [aDecoder decodeObjectForKey:kQuranicPostsAttachments];
    self.customFields = [aDecoder decodeObjectForKey:kQuranicPostsCustomFields];
    self.status = [aDecoder decodeObjectForKey:kQuranicPostsStatus];
    self.content = [aDecoder decodeObjectForKey:kQuranicPostsContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_postsIdentifier forKey:kQuranicPostsId];
    [aCoder encodeObject:_comments forKey:kQuranicPostsComments];
    [aCoder encodeObject:_categories forKey:kQuranicPostsCategories];
    [aCoder encodeDouble:_commentCount forKey:kQuranicPostsCommentCount];
    [aCoder encodeObject:_excerpt forKey:kQuranicPostsExcerpt];
    [aCoder encodeObject:_author forKey:kQuranicPostsAuthor];
    [aCoder encodeObject:_modified forKey:kQuranicPostsModified];
    [aCoder encodeObject:_titlePlain forKey:kQuranicPostsTitlePlain];
    [aCoder encodeObject:_tags forKey:kQuranicPostsTags];
    [aCoder encodeObject:_type forKey:kQuranicPostsType];
    [aCoder encodeObject:_title forKey:kQuranicPostsTitle];
    [aCoder encodeObject:_url forKey:kQuranicPostsUrl];
    [aCoder encodeObject:_date forKey:kQuranicPostsDate];
    [aCoder encodeObject:_commentStatus forKey:kQuranicPostsCommentStatus];
    [aCoder encodeObject:_slug forKey:kQuranicPostsSlug];
    [aCoder encodeObject:_attachments forKey:kQuranicPostsAttachments];
    [aCoder encodeObject:_customFields forKey:kQuranicPostsCustomFields];
    [aCoder encodeObject:_status forKey:kQuranicPostsStatus];
    [aCoder encodeObject:_content forKey:kQuranicPostsContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    QuranicPosts *copy = [[QuranicPosts alloc] init];
    
    if (copy) {

        copy.postsIdentifier = self.postsIdentifier;
        copy.comments = [self.comments copyWithZone:zone];
        copy.categories = [self.categories copyWithZone:zone];
        copy.commentCount = self.commentCount;
        copy.excerpt = [self.excerpt copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.modified = [self.modified copyWithZone:zone];
        copy.titlePlain = [self.titlePlain copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.commentStatus = [self.commentStatus copyWithZone:zone];
        copy.slug = [self.slug copyWithZone:zone];
        copy.attachments = [self.attachments copyWithZone:zone];
        copy.customFields = [self.customFields copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
    }
    
    return copy;
}


@end
