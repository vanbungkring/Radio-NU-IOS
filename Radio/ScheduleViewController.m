//
//  ScheduleViewController.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleView.h"
#import "StaticAndPreferences.h"
#import "ScheduleTableViewCell.h"
#import "CommonHelper.h"
#import "ScheduleDataSource.h"
#import "Schedule/ScheduleDataModels.h"
@interface ScheduleViewController ()
@property (nonatomic,strong)ScheduleDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[ScheduleDataSource alloc]init];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.allowsSelection = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSchedule) name:fetchScheduleDone object:nil];
    [self updateSchedule];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)updateSchedule {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([ScheduleResponse allSchedule].count > 0) {
                self.dataSource.scheduleData  =[ScheduleResponse allSchedule];
                [self.tableView reloadData];
            }
            else {
                NSLog(@"jadwal is empty");
                ///empty state
            }
        });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }
    else {
        UITableViewCell *orderCell = [self.dataSource tableView:self.tableView
                                                cellForRowAtIndexPath:indexPath];
        [orderCell updateConstraintsIfNeeded];
        [orderCell layoutIfNeeded];
        float height = [orderCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        return height;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
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
