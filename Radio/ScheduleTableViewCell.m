//
//  ScheduleTableViewCell.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "ScheduleTableViewCell.h"
#import "ScheduleDataModels.h"
@implementation ScheduleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)setSchedule:(ScheduleResults *)schedule {
    self.scheduleTimeLabel.text = schedule.firstValue;
    self.scheduleNameLabel.text = [schedule.value1 capitalizedString];
    self.scheduleExcerptLabel.text = [schedule.value2 capitalizedString];
    self.scheduleTimelineViewIndicator.layer.cornerRadius = self.scheduleTimelineViewIndicator.frame.size.width/2;
    self.scheduleTimelineViewIndicator.layer.borderWidth = 1.0f;
    self.scheduleTimelineViewIndicator.layer.borderColor = [UIColor whiteColor].CGColor;
    self.scheduleTimelineViewIndicator.layer.masksToBounds = YES;
}
@end
