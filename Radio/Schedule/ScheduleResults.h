//
//  ScheduleResults.h
//
//  Created by Ratna Kumalasari on 12/5/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface ScheduleResults : RLMObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *value2;
@property (nonatomic, strong) NSString *value1;
@property (nonatomic, strong) NSString *firstValue;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
