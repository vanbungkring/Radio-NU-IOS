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
#import "ScheduleDataModels.h"
@interface ScheduleViewController ()
@property (nonatomic,strong)ScheduleDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[ScheduleDataSource alloc]init];
    self.tableView.dataSource = self.dataSource;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSchedule) name:fetchScheduleDone object:nil];
    [self updateSchedule];
    // Do any additional setup after loading the view from its nib.
}
- (void)updateSchedule {
    if ([ScheduleResponse allSchedule].count >0) {
        self.dataSource.scheduleData  =[ScheduleResponse allSchedule];
        [self.tableView reloadData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }
    else {
        ScheduleTableViewCell *cell = (ScheduleTableViewCell*)[self.dataSource tableView:self.tableView
                                                                             cellForRowAtIndexPath:indexPath];
        [cell updateConstraintsIfNeeded];
        [cell layoutIfNeeded];
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        return height;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }
    else {
        ScheduleTableViewCell *cell = (ScheduleTableViewCell*)[self.dataSource tableView:self.tableView
                                                                             cellForRowAtIndexPath:indexPath];
        [cell updateConstraintsIfNeeded];
        [cell layoutIfNeeded];
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        return height;
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
