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
@property (weak, nonatomic) IBOutlet UILabel *scheduleTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *dotViewIndicator;
@property (weak, nonatomic) IBOutlet UILabel *scheduleNameLabel;
@property (nonatomic,strong)ScheduleResults *result;

@end
