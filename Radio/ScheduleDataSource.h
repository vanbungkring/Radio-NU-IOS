//
//  ScheduleDataSource.h
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ScheduleDataSource : NSObject <UITableViewDataSource>
@property  (nonatomic,strong) NSArray *scheduleData;
@end
