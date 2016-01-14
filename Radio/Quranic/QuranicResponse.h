//
//  QuranicResponse.h
//
//  Created by Ratna Kumalasari on 12/6/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface QuranicResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double countTotal;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *posts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
+ (NSURLSessionDataTask *)getQuranicQuotesWithParams:(NSDictionary *)params CompletionBlock:(void(^)(NSArray *json,NSError *error))completion;
@end
