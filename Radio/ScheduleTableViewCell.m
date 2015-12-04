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
- (void)layoutSubviews {
    self.dotViewIndicator.layer.cornerRadius = self.dotViewIndicator.frame.size.width/2;
    self.dotViewIndicator.layer.masksToBounds = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setResult:(ScheduleResults *)result {
    self.scheduleTimeLabel.text = result.firstValue;
    self.scheduleNameLabel.text = result.value1;
    CABasicAnimation *theAnimation;
    
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=1.5;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
    [self.dotViewIndicator.layer addAnimation:theAnimation forKey:@"animateOpacity"];
}
@end
