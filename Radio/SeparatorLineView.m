//
//  SeparatorLineView.m
//  Traveloka
//
//  Created by Bobby Suryanaga on 4/16/15.
//  Copyright (c) 2015 Traveloka. All rights reserved.
//

#import "SeparatorLineView.h"

@implementation SeparatorLineView

- (void)drawRect:(CGRect)rect {
    
    [[UIColor clearColor] set];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextFillRect(currentContext, rect);
    if (self.lineColor) {
        [self.lineColor set];
    }
    else {
        [[UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.00] set];
    }
    CGContextSetLineWidth(currentContext,1.0f/[UIScreen mainScreen].scale);
    if (self.dashed) {
        CGFloat dashes[] = {self.dashLength/[UIScreen mainScreen].scale, self.spaceLength/[UIScreen mainScreen].scale};
        CGContextSetLineDash(currentContext, 0.0f, dashes, 2);
    }
    if (self.isVerticalLine) {
        CGContextMoveToPoint(currentContext,0.0f, 0.0f);
        CGContextAddLineToPoint(currentContext,0.0f, rect.size.height);
    }
    else {
        if (self.drawOnTop) {
            CGContextMoveToPoint(currentContext,0.0f, 0);
            CGContextAddLineToPoint(currentContext,rect.size.width, 0);
        }
        else {
            CGContextMoveToPoint(currentContext,0.0f, rect.size.height);
            CGContextAddLineToPoint(currentContext,rect.size.width, rect.size.height);
        }
    }
    CGContextStrokePath(currentContext);
}

@end
