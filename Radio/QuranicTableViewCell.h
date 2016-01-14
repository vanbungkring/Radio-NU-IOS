//
//  QuranicTableViewCell.h
//  Radio
//
//  Created by Arie on 12/6/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuranicPosts;
@interface QuranicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *quranicLabelContent;
@property (weak, nonatomic) IBOutlet UILabel *surahAndAyatLabel;
@property  (nonatomic,strong) QuranicPosts *post;

@end
