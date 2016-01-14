//
//  QuranicAuthor.h
//
//  Created by Ratna Kumalasari on 12/6/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface QuranicAuthor : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double authorIdentifier;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *authorDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *firstName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
