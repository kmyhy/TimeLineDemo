//
//  LifeTimeLine.m
//  Client
//
//  Created by qq on 2016/12/27.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "TimeLineView.h"

@implementation TimeLineView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}

-(void)setup{
    self.backgroundColor = [UIColor clearColor];
    self.circleColor = [UIColor colorWithRed: 0.102 green: 0.824 blue: 0.753 alpha: 1];
    self.timeLineColor = [UIColor colorWithRed: 0.847 green: 0.847 blue: 0.847 alpha: 1];
    self.nodeRadius = 2;
    self.timeLineWidth = 1;
    self.nodePosition = 0.5;

    self.circleRadius = 6.5;
    self.circleStrokeWidth = 1.5;
    
    // 不绘制节点、也不绘制终点，也不绘制时间线
    self.nodeVisible = NO;
    self.circleVisible = NO;
    self.timelineVisible = NO;
}

-(void)drawRect:(CGRect)rect{
    CGRect r= self.bounds;
    
    [self drawImageWithFrame:r];
}
- (void)drawImageWithFrame: (CGRect)frame
{
    UIColor* nodeColor = _circleVisible ? _circleColor : _timeLineColor;

    CGRect rectangleRect;
    
    CGPoint ovalCenter = CGPointMake(round(CGRectGetMidX(frame)), round(CGRectGetMidY(frame)));
    if(_circleVisible){
        rectangleRect = CGRectMake(round(ovalCenter.x-_timeLineWidth/2),ovalCenter.y, _timeLineWidth, round((CGRectGetHeight(frame)-ovalCenter.y)));
    }else{
        rectangleRect = CGRectMake(round(ovalCenter.x-_timeLineWidth/2), 0, _timeLineWidth, round(CGRectGetHeight(frame)));
    }
    
    UIBezierPath *rectanglePath= [UIBezierPath bezierPathWithRect: rectangleRect];
    [_timeLineColor setFill];
    [rectanglePath fill];
    
    if(_nodeVisible){
    
        CGRect nodeRect = CGRectMake(round(ovalCenter.x-_nodeRadius), round(ovalCenter.y-_nodeRadius), _nodeRadius*2, _nodeRadius*2);
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: nodeRect];
        [nodeColor setFill];
        [ovalPath fill];
        
    }
    if(_circleVisible){
        CGRect circleRect = CGRectMake(round(ovalCenter.x-_circleRadius +_circleStrokeWidth/2), round(ovalCenter.y-_circleRadius+_circleStrokeWidth/2), _circleRadius*2-_circleStrokeWidth, _circleRadius*2-_circleStrokeWidth);
        UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: circleRect];
        [_circleColor setStroke];
        oval2Path.lineWidth = _circleStrokeWidth;
        [oval2Path stroke];
    }
    
}

@end
