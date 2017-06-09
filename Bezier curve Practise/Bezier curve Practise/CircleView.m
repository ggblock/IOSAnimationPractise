//
//  CircleView.m
//  Bezier curve Practise
//
//  Created by Apple on 2017/6/9.
//  Copyright © 2017年 ganggang. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    //虚线框路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.bounds.size.width * (1.0/8 + _progress * 0.5), self.bounds.size.height/8*3, self.bounds.size.width/4, self.bounds.size.height/4)];
    
    CGFloat fs[] = {20,5};
    
    [path setLineDash:fs count:2 phase:0];
    
    [path stroke];
}


@end
