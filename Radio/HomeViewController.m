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
#import "StreamingViewController.h"
#import "QuranicViewController.h"
#import <HMSegmentedControl.h>
@interface HomeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet HMSegmentedControl *segmentedControl;
@property (strong, nonatomic) HomeView *view;
@property (weak, nonatomic) IBOutlet UIScrollView *homeScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeScrollView.delegate = self;
    self.title = @"#RadioNU";
    self.segmentedControl.sectionTitles = @[@"Jadwal", @"Radio"];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.129 green:0.627 blue:0.141 alpha:1];
    self.segmentedControl.selectionIndicatorHeight = 2.0f;
    UIFont *font = [UIFont fontWithName:@"MuseoSans-500" size:17.0f];
    UIFont *font2 = [UIFont fontWithName:@"MuseoSans-500" size:18.0f];
    [self.segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor darkGrayColor],NSFontAttributeName: font};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.129 green:0.627 blue:0.141 alpha:1],NSFontAttributeName: font2};
    //     Do any additional setup after loading the view from its nib.
    //    /do schedule
    
    ScheduleViewController *scheduleViewController = [[ScheduleViewController alloc]initWithNibName:@"ScheduleViewController" bundle:nil];
    [self addChildViewController:scheduleViewController];
    [self.view addSchedulePageView:scheduleViewController.view];
    
    
    StreamingViewController *streaming = [[StreamingViewController alloc]initWithNibName:@"StreamingViewController" bundle:nil];
    [self addChildViewController:streaming];
    [self.view addRadioStreamPageView:streaming.view];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [self.homeScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else {
        [self.homeScrollView setContentOffset:CGPointMake(self.view.frame.size.width*(segmentedControl.selectedSegmentIndex+0), 0) animated:YES];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.homeScrollView.contentOffset.x < self.view.frame.size.width/2) {
        [self.segmentedControl setSelectedSegmentIndex:0 animated:YES];
    }
    else {
        [self.segmentedControl setSelectedSegmentIndex:1 animated:YES];
    }
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
