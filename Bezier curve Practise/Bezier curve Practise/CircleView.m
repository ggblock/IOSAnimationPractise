//
//  CircleView.m
//  Bezier curve Practise
//
//  Created by Apple on 2017/6/9.
//  Copyright © 2017年 ganggang. All rights reserved.
//

#import "CircleView.h"

//虚线框的边长
#define SQUARESIDELENGTH self.bounds.size.width/4
#define PROPORTION 0.22

@implementation CircleView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGRect quareRect = CGRectMake(self.bounds.size.width * (1.0/8 + _progress * 0.5), self.bounds.size.height/8*3, self.bounds.size.width/4, self.bounds.size.height/4);
    
    //虚线框的中心点
    CGPoint centerPoint = CGPointMake(self.bounds.size.width * (1.0/4 + _progress * 0.5), self.bounds.size.height/2);
    
    //虚线框路径
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:quareRect];
    
    CGFloat fs[] = {20,5};
    
    [path1 setLineDash:fs count:2 phase:0];
    
    [path1 stroke];
    
    //辅助八边形线框路径
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    //从0点钟方向12个点分别是AIKDLJBHFCEG点
    CGPoint pointA = CGPointMake(centerPoint.x, centerPoint.y - 0.5*SQUARESIDELENGTH*(1-ABS(_progress - 0.5)));
    
    CGPoint pointB = CGPointMake(centerPoint.x, centerPoint.y + 0.5*SQUARESIDELENGTH*(1-ABS(_progress - 0.5)));
    
    CGPoint pointI = CGPointMake(centerPoint.x + PROPORTION*SQUARESIDELENGTH, centerPoint.y - 0.5*SQUARESIDELENGTH*(1-ABS(_progress - 0.5)));
    
    CGPoint pointJ = CGPointMake(centerPoint.x + PROPORTION*SQUARESIDELENGTH, centerPoint.y + 0.5*SQUARESIDELENGTH*(1-ABS(_progress - 0.5)));
    
    CGPoint pointG = CGPointMake(centerPoint.x - PROPORTION*SQUARESIDELENGTH, centerPoint.y - 0.5*SQUARESIDELENGTH*(1-ABS(_progress - 0.5)));
    
    CGPoint pointH = CGPointMake(centerPoint.x - PROPORTION*SQUARESIDELENGTH, centerPoint.y + 0.5*SQUARESIDELENGTH*(1-ABS(_progress - 0.5)));
    
    //如果往右滑,c不动,d动
    CGPoint pointC,pointD;
    if (_progress >= 0.5) {
        pointC = CGPointMake(centerPoint.x - 0.5*SQUARESIDELENGTH, centerPoint.y);
        
        pointD = CGPointMake(centerPoint.x + SQUARESIDELENGTH/2 + 0.5*SQUARESIDELENGTH*(ABS(_progress - 0.5)), centerPoint.y);
        
    }else {
        pointC = CGPointMake(centerPoint.x - SQUARESIDELENGTH/2 - 0.5*SQUARESIDELENGTH*(ABS(_progress - 0.5)), centerPoint.y);
        
        pointD = CGPointMake(centerPoint.x + + 0.5*SQUARESIDELENGTH, centerPoint.y);
    }
    
    CGPoint pointK = CGPointMake(pointD.x, pointD.y - PROPORTION*SQUARESIDELENGTH);
    
    CGPoint pointL = CGPointMake(pointD.x, pointD.y + PROPORTION*SQUARESIDELENGTH);
    
    CGPoint pointE = CGPointMake(pointC.x, pointC.y - PROPORTION*SQUARESIDELENGTH);
    
    CGPoint pointF = CGPointMake(pointC.x, pointC.y + PROPORTION*SQUARESIDELENGTH);
    
    [path2 moveToPoint:pointA];
    
    [path2 addLineToPoint:pointI];
    
    [path2 addLineToPoint:pointK];
    
    [path2 addLineToPoint:pointD];
    
    [path2 addLineToPoint:pointL];
    
    [path2 addLineToPoint:pointJ];
    
    [path2 addLineToPoint:pointB];
    
    [path2 addLineToPoint:pointH];
    
    [path2 addLineToPoint:pointF];
    
    [path2 addLineToPoint:pointC];
    
    [path2 addLineToPoint:pointE];
    
    [path2 addLineToPoint:pointG];
    
    [path2 addLineToPoint:pointA];
    
    CGFloat fs1[] = {10,2};
    
    [path2 setLineDash:fs1 count:2 phase:0];
    
    [path2 stroke];
    
    //用贝塞尔曲线填充圆
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    
    [path3 moveToPoint:pointA];
    
    [path3 addCurveToPoint:pointD controlPoint1:pointI controlPoint2:pointK];
    
    [path3 addCurveToPoint:pointB controlPoint1:pointL controlPoint2:pointJ];
    
    [path3 addCurveToPoint:pointC controlPoint1:pointH controlPoint2:pointF];
    
    [path3 addCurveToPoint:pointA controlPoint1:pointE controlPoint2:pointG];
    
    [[UIColor greenColor]setFill];
    
    [path3 fill];
}




@end
