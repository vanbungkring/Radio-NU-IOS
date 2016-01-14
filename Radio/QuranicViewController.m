//
//  QuranicViewController.m
//  Radio
//
//  Created by Arie on 12/6/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "QuranicViewController.h"
#import "Quranic/QuranicDataModels.h"
#import "QuranicDataSource.h"
#import "CommonHelper.h"
#import "CommonHelper.h"
@interface QuranicViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *quranicTableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) QuranicDataSource *dataSoure;

@property (nonatomic,strong) UIRefreshControl *refreshControl;
@end

@implementation QuranicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshTable];
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [self.quranicTableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    self.dataSoure = [[QuranicDataSource alloc]init];
    self.quranicTableView.delegate = self;
    self.quranicTableView.tableFooterView = [UIView new];
    self.quranicTableView.dataSource = self.dataSoure;
    //    [self.quranicTableView reloadData];
    // Do any additional setup after loading the view from its nib.
}
-(void)refreshView:(UIRefreshControl *)refresh {
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    // custom refresh logic would be placed here..
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",[CommonHelper dateStringFromDate:[NSDate date] withFormat:@"MMM d, h:mm"]];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    [self fetchQuranic:1];
}


- (void)refreshTable {
    [self fetchQuranic:1];
}
- (void)fetchQuranic:(NSInteger)pages {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [QuranicResponse getQuranicQuotesWithParams:@{@"page":[NSNumber numberWithInteger:pages]} CompletionBlock:^(NSArray *json, NSError *error) {
            if (!error) {
                [self.refreshControl endRefreshing];
                self.dataSoure.quranQuoteArray  =json;
                [self.quranicTableView reloadData];
            }
        }];
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
        UITableViewCell *orderCell = [self.dataSoure tableView:self.quranicTableView
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
