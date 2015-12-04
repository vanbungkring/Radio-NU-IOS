//
//  HomeViewController.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "CommonHelper.h"
#import "ScheduleViewController.h"
#import <HMSegmentedControl.h>
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet HMSegmentedControl *segmentedControl;
@property (strong, nonatomic) HomeView *view;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"data-->%f",[CommonHelper getCurrentTime]);
    self.segmentedControl.sectionTitles = @[@"Jadwal", @"Radio",@"Quranic"];

    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.17 green:0.75 blue:0.73 alpha:1.00];
    self.segmentedControl.selectionIndicatorHeight = 2.0f;
//    self.segmentedControls.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.17 green:0.75 blue:0.73 alpha:0.5],NSFontAttributeName:[UIFont montserratFontOfSize:15]};
//    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.17 green:0.75 blue:0.73 alpha:1.00]};
    // Do any additional setup after loading the view from its nib.
    ///do schedule
    
    ScheduleViewController *scheduleViewController = [[ScheduleViewController alloc]initWithNibName:@"ScheduleViewController" bundle:nil];
    [self addChildViewController:scheduleViewController];
    [self.view addSchedulePageView:scheduleViewController.view];
}
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view {
    return UIBarPositionBottom;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
