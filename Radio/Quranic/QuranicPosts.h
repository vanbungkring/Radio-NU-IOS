//
//  QuranicPosts.h
//
//  Created by Ratna Kumalasari on 12/6/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuranicAuthor, QuranicCustomFields;

@interface QuranicPosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double postsIdentifier;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, strong) NSString *excerpt;
@property (nonatomic, strong) QuranicAuthor *author;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSString *titlePlain;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *commentStatus;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSArray *attachments;
@property (nonatomic, strong) QuranicCustomFields *customFields;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
