//
//  ScheduleDataSource.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "ScheduleDataSource.h"
#import "ScheduleDataModels.h"
#import "ScheduleTableViewCell.h"
@implementation ScheduleDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.scheduleData.count-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScheduleResults *schedule = [self.scheduleData objectAtIndex:indexPath.row+1];
    static NSString *CellIdentifier = @"ScheduleTableViewCell";
    ScheduleTableViewCell *cell = (ScheduleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        UINib *cellNib = [UINib nibWithNibName:CellIdentifier bundle:nil];
        [tableView registerNib:cellNib forCellReuseIdentifier:CellIdentifier];
        cell = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil][0];
    }
    [cell setSchedule:schedule];
    return cell;
}
- (NSAttributedString *)setAttributeStringForLocations:(NSString *)stringSource {
    NSMutableDictionary *attributesDictionary = [NSMutableDictionary dictionary];
    
    [attributesDictionary setObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
    [attributesDictionary setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [attributesDictionary setObject:[UIColor blackColor] forKey:NSBackgroundColorAttributeName];
    [attributesDictionary setObject:@5.0 forKey:NSBaselineOffsetAttributeName];
    [attributesDictionary setObject:@2.0 forKey:NSStrikethroughStyleAttributeName];
    [attributesDictionary setObject:[UIColor redColor] forKey:NSStrokeColorAttributeName];
    [attributesDictionary setObject:@2.0 forKey:NSStrokeWidthAttributeName];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 2.0;
    [attributesDictionary setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor lightGrayColor];
    shadow.shadowBlurRadius = 1.0;
    shadow.shadowOffset = CGSizeMake(0.0, 2.0);
    [attributesDictionary setObject:shadow forKey:NSShadowAttributeName];
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:stringSource];
    
    return attributedString;
    
}
@end
