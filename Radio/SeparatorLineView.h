//
//  SeparatorLineView.h
//  Traveloka
//
//  Created by Bobby Suryanaga on 4/16/15.
//  Copyright (c) 2015 Traveloka. All rights reserved.
//

#import <UIKit/UIKit.h>

//IB_DESIGNABLE
@interface SeparatorLineView : UIView

@property (assign, nonatomic) IBInspectable BOOL isVerticalLine;
@property (strong, nonatomic) IBInspectable UIColor *lineColor;
@property (assign, nonatomic) IBInspectable BOOL dashed;
@property (assign, nonatomic) IBInspectable CGFloat dashLength;
@property (assign, nonatomic) IBInspectable CGFloat spaceLength;
@property (assign, nonatomic) IBInspectable BOOL drawOnTop;

@end
