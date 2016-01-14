//
//  QuranicDataSource.h
//  Radio
//
//  Created by Arie on 12/6/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QuranicDataSource : NSObject<UITableViewDataSource>
@property  (nonatomic,strong) NSArray *quranQuoteArray;

@end
