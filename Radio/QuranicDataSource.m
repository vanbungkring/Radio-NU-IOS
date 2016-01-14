//
//  QuranicDataSource.m
//  Radio
//
//  Created by Arie on 12/6/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "QuranicDataSource.h"
#import "QuranicTableViewCell.h"
#import "Quranic/QuranicDataModels.h"
@implementation QuranicDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.quranQuoteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuranicPosts *post = [self.quranQuoteArray objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"QuranicTableViewCell";
    QuranicTableViewCell *cell = (QuranicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        UINib *cellNib = [UINib nibWithNibName:[QuranicTableViewCell debugDescription] bundle:nil];
        [tableView registerNib:cellNib forCellReuseIdentifier:[QuranicTableViewCell debugDescription]];
        cell = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil][0];
    }
    [cell setPost:post];
    return cell;
}
@end
