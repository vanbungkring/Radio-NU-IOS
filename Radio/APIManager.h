//
//  APIManager.h
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface APIManager : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
