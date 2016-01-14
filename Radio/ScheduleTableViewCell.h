//
//  ScheduleTableViewCell.h
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScheduleResults;
@interface ScheduleTableViewCell : UITableViewCell
@property (nonatomic,strong)ScheduleResults *schedule;
@property (weak, nonatomic) IBOutlet UILabel *scheduleTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scheduleNameLabel;
@property (weak, nonatomic) IBOutlet UIView *scheduleTimelineViewIndicator;
@property (weak, nonatomic) IBOutlet UILabel *scheduleExcerptLabel;
@end
