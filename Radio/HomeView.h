//
//  HomeView.h
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeView : UIView
@property (weak, nonatomic) IBOutlet UIView *contentContainerView;
- (void)addSchedulePageView:(UIView *)view;
- (void)addQuranicPageView:(UIView *)view;
- (void)addRadioStreamPageView:(UIView *)view;

@end
